-- Load cmp-nvim-lsp
local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    print('cmp-nvim-lsp is not working. Skipping...')
    return
end


local M = {}
function M.settings(server)
    if server == 'lua_ls' then
        return {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim', 'a' },
                },
            }
        }
    elseif server == 'dartls' then
        return {
            dart = {
                completeFunctionCalls = true,
                showTodos = true
            }
        }
    elseif server == 'pylsp' then
        return {
            pylsp = {
                plugins = {
                    -- Turn these off to use flake8, see: https://github.com/python-lsp/python-lsp-server
                    pycodestyle = {
                        enabled = false,
                    },
                    mccabe = { enabled = false },
                    pyflakes = { enabled = false },

                    -- Turn these off to use black, see: https://github.com/python-lsp/python-lsp-black
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },

                    -- Linter
                    flake8 = { enabled = true },
                    -- Formatter
                    black = { enabled = true },
                    -- Sort libs
                    isort = { enabled = true },


                },
                configurationSources = { 'flake8' },
            }
        }
    elseif server == 'pyright' then
        return {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = 'off'
                },
            }
        }
    end
    return {}
end

function M.on_attach(server, buff)
    local config = {
        -- disable virtual text
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 60,
    })

    local opts = { buffer = buff }
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<C-d>', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<C-u>', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', 'gll', vim.diagnostic.setloclist)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)
    -- Automatically show diagnostic
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>df', vim.lsp.buf.type_definition, opts)

    -- Auto document highlighting
    vim.cmd [[
        augroup document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
    ]]

    -- TODO: Inlay hint of neovim
    -- if server.server_capabilities.inlayHintProvider then
    --     vim.lsp.inlay_hint.enable(buff, true)
    -- end

    -- TODO: Auto formatting when saving file (should adjust the row's length in black)
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --     buffer = buff,
    --     callback = function()
    --         vim.lsp.buf.format { async = false }
    --     end
    -- })
end

function M.capabilities()
    -- Add additional capabilities supported by nvim-cmp
    return cmp_nvim_lsp.default_capabilities()
end

return M
