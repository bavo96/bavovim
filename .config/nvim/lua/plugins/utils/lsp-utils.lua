-- Load cmp-nvim-lsp
local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    print('cmp-nvim-lsp is not working. Skipping...')
    return
end

local function set_lsp_keymap(buff)
    -- === nvim-lspconfig ===
    local opt = { noremap = true, silent = true }
    local lspopt = { buffer = buff }
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, lspopt)
    vim.keymap.set('n', '<C-d>', vim.diagnostic.goto_next, lspopt)
    vim.keymap.set('n', '<C-u>', vim.diagnostic.goto_prev, lspopt)
    vim.keymap.set('n', 'gll', vim.diagnostic.setloclist)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lspopt)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lspopt)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, lspopt)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lspopt)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, lspopt)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, lspopt)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, lspopt)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, lspopt)
    vim.keymap.set('n', '<leader>df', vim.lsp.buf.type_definition, lspopt)
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
                hint = { enable = true }
            }
        }
    elseif server == 'bashls' then
        return {
            {
                bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.command)"
                }
            }
        }
    elseif server == 'ruff_lsp' then -- ===> Linting, Formatting, Organization Imports in python
        return {
            init_options = {
                settings = {
                    -- Any extra CLI arguments for `ruff` go here.
                    args = { config = "./pyproject.toml" },
                }
            }
        }
    elseif server == 'pylsp' then -- ===> Completions, Definitions, Hover, References, Signature Help, and Symbols in Python
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

                    -- Currenlty turn off to use ruff
                    -- Linter
                    flake8 = { enabled = false },
                },
                configurationSources = { 'flake8' },
            }
        }
    elseif server == 'pyright' then -- ===> Still keep this for backup. Can use with ruff_lsp: https://github.com/astral-sh/ruff-lsp?tab=readme-ov-file#setup
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
end

function M.on_attach(server, buff)
    -- Disable hover in favor of python lsp server
    if server.name == 'ruff_lsp' then
        server.server_capabilities.hoverProvider = false
    end

    -- Set lsp keymap
    set_lsp_keymap(buff)

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

    -- Automatically show diagnostic
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

    -- Auto document highlighting
    -- https://github.com/haskell/haskell-language-server/issues/1148 (change to server_capabilities)
    if server.server_capabilities.document_highlight then
        vim.cmd [[
            augroup document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end

    -- Auto formatting when saving file
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buff,
        callback = function()
            vim.lsp.buf.format { async = false }
        end
    })
end

function M.capabilities()
    -- Add additional capabilities supported by nvim-cmp
    return cmp_nvim_lsp.default_capabilities()
end

return M
