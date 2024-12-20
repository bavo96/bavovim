local function set_lsp_keymap(buff)
    -- === nvim-lspconfig ===
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

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
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
    elseif server == 'ruff' then -- ===> Linting, Formatting, Organization Imports in python
        -- https://docs.astral.sh/ruff/editors/#language-server-protocol
        return {
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
                configurationSources = {},
            }
        }
    elseif server == 'html' then
        return {}
    elseif server == 'cssls' then
        return {
            css = {
                validate = true,
            },
            scss = {
                validate = true,
            },
            less = {
                validate = true,
            },
        }
    else
        return {}
    end
end

function M.on_attach(server, buff)
    -- Disable hover in favor of python lsp server
    if server.name == 'ruff' then
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

    local formatter = { 'ruff', 'null-ls', 'lua_ls', 'html', 'cssls', 'bashls' }

    -- Auto formatting when saving file
    if server.supports_method("textDocument/formatting") and has_value(formatter, server.name) then
        print("Auto formatting for " .. server.name)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = buff,
            callback = function()
                vim.lsp.buf.format {
                    async = false,
                    filter = function(client)
                        return client.name == server.name
                    end
                }
            end
        })
    end
end

function M.capabilities()
    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Enable (broadcasting) snippet capability for completion
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- return capabilities
    return nil
end

function M.init_options(server)
    if server == "cssls" then
        return {
            provideFormatter = true
        }
    elseif server == "html" then
        return {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true
            },
            provideFormatter = true
        }
    elseif server == "ruff" then
        return {
            settings = {
                logLevel = 'debug',
                args = { config = "./pyproject.toml" },
            }
        }
    else
        return {}
    end
end

return M
