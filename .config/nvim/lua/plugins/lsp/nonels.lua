-- advanced lspconfig
return {
    'nvimtools/none-ls.nvim',
    enabled = true,
    config = function()
        local null_ls = require("null-ls")
        local sources = {
            -- python
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.diagnostics.mypy,
        }

        require("null-ls").setup({
            sources = sources,
        })
    end
}
