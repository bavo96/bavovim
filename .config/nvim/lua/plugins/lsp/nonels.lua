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
        -- Load lsp settings
        local lsputils = require('plugins.utils.lsp-utils');

        null_ls.setup({
            sources = sources,
            on_attach = lsputils.on_attach,
        })
    end
}
