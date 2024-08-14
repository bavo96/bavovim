-- Autocompletion and snippets are handled by nvim-cmp, cmp-nvim-lsp, cmp_luasnip, and LuaSnip.

return {
    -- LSP source for nvim-cmp (autocompletion, snippets)
    {
        'hrsh7th/cmp-nvim-lsp',
    },

    -- Snippets plugin (beside LSP)
    {
        'L3MON4D3/LuaSnip',                 -- Snippets plugin  to expand snippets
        dependencies = {
            'rafamadriz/friendly-snippets', -- VScode source
            'saadparwaiz1/cmp_luasnip',     -- Snippets source for nvim-cmp (beside LSP)
        },
    },
    {
        'hrsh7th/nvim-cmp', -- Main autocompletion plugin
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- Use <CR> to confirm completion
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    -- Use <C-e> to close completion
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Use <Tab>, <S-Tab> for completion, jump between placeholders
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                -- snippets' sources
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }, -- For luasnip users.
                    },
                    {
                        { name = 'buffer' },
                        { name = 'path' },
                    })
            }
        end,
    },
}
