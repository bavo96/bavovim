-- lspconfig
return {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    config = function()
        -- Load lsp settings
        local lsputils = require('plugins.utils.lsp-utils');

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        for _, client in ipairs(lsputils.clients) do
            vim.lsp.config[client] = {
                settings = lsputils.settings(client),
                init_options = lsputils.init_options(client),
                filetypes = lsputils.filetypes(client),
                capabilities = lsputils.capabilities(),
                on_attach = lsputils.on_attach,
            }
        end;
        vim.lsp.enable(lsputils.clients)
    end
}
