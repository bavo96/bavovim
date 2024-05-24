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

        -- Install additional packages for pylsp, but not success
        -- local function mason_package_path(package)
        --     local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package .. "/venv/bin/")
        --     return path
        -- end
        --
        -- -- depends on package manager / language
        -- local command = "pip3"
        -- local args = { "install", "python-lsp-isort", "python-lsp-black" }
        --
        -- local job = require("plenary.job")
        -- job:new({
        --     cwd = mason_package_path("python-lsp-server"),
        --     command = command,
        --     args = args,
        -- }):start()
    end,
}
