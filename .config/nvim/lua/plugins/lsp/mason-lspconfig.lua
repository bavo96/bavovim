return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        local lsputils = require('plugins.utils.lsp-utils');
        require("mason-lspconfig").setup({
            -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
            -- This setting has no relation with the `automatic_installation` setting.
            -- ensure_installed = lsputils.clients,
            ensure_installed = { 'bashls', 'eslint', 'lua_ls', 'stylelint_lsp', 'ts_ls' }

            -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Servers are not automatically installed.
            --   - true: All servers set up via lspconfig are automatically installed.
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
            -- automatic_installation = true,

        })
    end
}
