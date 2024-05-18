-- advanced lspconfig
return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        local sources = {
            -- python
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
        }

        require("null-ls").setup({
            sources = sources,
        })
    end
}
