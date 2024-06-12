-- lspconfig
return {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    config = function()
        -- Load lsp settings
        local lsputils = require('plugins.utils.lsp-utils');

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = { 'pylsp', 'ruff_lsp', 'lua_ls', 'bashls' };

        for _, server in ipairs(servers) do
            require("lspconfig")[server].setup(
                {
                    settings = lsputils.settings(server),
                    on_attach = lsputils.on_attach,
                    capabilities = lsputils.capabilities(),
                }

            )
        end;
    end
}
