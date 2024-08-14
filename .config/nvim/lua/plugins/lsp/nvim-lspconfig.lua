-- lspconfig
return {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    config = function()
        -- Load lsp settings
        local lsputils = require('plugins.utils.lsp-utils');

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = { 'pylsp', 'ruff', 'lua_ls', 'bashls', 'html', 'cssls' };

        for _, server in ipairs(servers) do
            require("lspconfig")[server].setup(
                {
                    settings = lsputils.settings(server),
                    on_attach = lsputils.on_attach,
                    capabilities = lsputils.capabilities(),
                    init_options = lsputils.init_options(server),
                }

            )
        end;
    end
}
