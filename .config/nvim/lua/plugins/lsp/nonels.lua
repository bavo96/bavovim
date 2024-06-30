-- advanced lspconfig
return {
    'nvimtools/none-ls.nvim',
    enabled = true,
    config = function()
        local null_ls = require("null-ls")
        local sources = {
            null_ls.builtins.diagnostics.buf,
            null_ls.builtins.formatting.isort
        }

        require("null-ls").setup({
            sources = sources,
        })
    end
}
