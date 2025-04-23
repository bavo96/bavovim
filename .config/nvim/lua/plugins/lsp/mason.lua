-- LSP servers, DAP servers, linters, and formatters.
return {
    'williamboman/mason.nvim',
    build = function()
        local mason_update = require('mason.api.command')
        mason_update.MasonUpdate() -- :MasonUpdate updates registry contents
    end,
    config = function()
        require("mason").setup(
            {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }

            }
        )
    end,
}
