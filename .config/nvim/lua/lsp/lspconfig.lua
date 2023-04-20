-- For more information, go to https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- Load lspconfig
local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('lspconfig is not working. Skipping...')
    return
end

-- Load lsp settings
local lsputils= require('lsp.lsputils')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'lua_ls', 'bashls', 'dartls' }

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = lsputils.on_attach,
        capabilities = lsputils.capabilities(),
        settings = lsputils.settings(server)
    }
end

