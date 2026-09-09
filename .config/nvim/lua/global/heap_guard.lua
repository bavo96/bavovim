-- heap_guard.lua
--
-- Best-effort mitigations against nvim's own memory growing unbounded over a
-- long-lived session (stale hidden buffers, treesitter parse trees on huge
-- files, LSP clients left running with nothing attached). Undo history is
-- already capped separately in global/option.lua (undolevels/undoreload).
--
-- This is a mitigation, not a cure: Lua/LuaJIT and the system allocator
-- rarely hand freed memory back to the OS, so heap growth only slows down
-- here, it doesn't reverse. The actual backstop for panes kept open for
-- weeks is the external scripts/nvim_heap_guard.sh watchdog (installed via
-- `install.sh -g`), which periodically restarts nvim outright.

local M = {}

local IDLE_BUFFER_MINUTES = 30
local LARGE_FILE_BYTES = 200 * 1024 -- 200 KB

-- Wipe hidden, unmodified buffers nobody has touched in a while, so any
-- LSP/treesitter/undo state pinned to them gets released.
local function cleanup_idle_buffers()
    local now = os.time()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" then
            local info = vim.fn.getbufinfo(buf)[1]
            if info and info.hidden == 1 and info.changed == 0
                and (now - info.lastused) > IDLE_BUFFER_MINUTES * 60 then
                pcall(vim.api.nvim_buf_delete, buf, { force = false })
            end
        end
    end
end

-- Disable treesitter highlighting on very large files before it ever parses
-- them — a big parse tree is one of the harder-to-shrink parts of the heap.
-- No-op (pcall swallows it) if treesitter highlighting isn't active.
local function guard_large_files(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then return end
    local uv = vim.uv or vim.loop
    local ok, stats = pcall(uv.fs_stat, name)
    if ok and stats and stats.size > LARGE_FILE_BYTES then
        vim.b[bufnr].large_buf = true
        pcall(vim.cmd, "TSBufDisable highlight")
    end
end

-- Stop an LSP client once it has no buffers attached instead of letting it
-- idle for weeks — basedpyright/ts_ls/etc. accumulate their own
-- multi-hundred-MB analysis caches the longer they stay warm.
local function stop_if_orphaned(client_id)
    local client = vim.lsp.get_client_by_id(client_id)
    if client and #vim.lsp.get_buffers_by_client_id(client_id) == 0 then
        client.stop()
    end
end

function M.setup()
    local group = vim.api.nvim_create_augroup("HeapGuard", { clear = true })

    vim.api.nvim_create_autocmd("CursorHold", {
        group = group,
        desc = "heap_guard: wipe idle hidden buffers",
        callback = cleanup_idle_buffers,
    })

    vim.api.nvim_create_autocmd("BufReadPre", {
        group = group,
        desc = "heap_guard: skip treesitter on large files",
        callback = function(args) guard_large_files(args.buf) end,
    })

    -- Nudge Lua's GC when nvim loses focus. This won't return memory to the
    -- OS on its own, but it slows growth between the watchdog's restarts.
    vim.api.nvim_create_autocmd({ "FocusLost", "VimSuspend" }, {
        group = group,
        desc = "heap_guard: GC on focus lost",
        callback = function() collectgarbage("collect") end,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
        group = group,
        desc = "heap_guard: stop orphaned LSP clients",
        callback = function(args)
            local client_id = args.data and args.data.client_id
            if client_id then
                vim.defer_fn(function() stop_if_orphaned(client_id) end, 2000)
            end
        end,
    })
end

return M
