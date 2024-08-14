return {
    -- autocomplete, snippet
    { -- Autocompletion plugin
        'hrsh7th/nvim-cmp',
        config = function()
            -- Autocompletion
            -- nvim-cmp setup
            local cmp = require("cmp")
            local luasnip = require("luasnip")
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
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'nvim_lua' },
                        { name = 'vsnip' },     -- For vsnip users.
                        { name = 'luasnip' },   -- For luasnip users.
                        { name = 'ultisnips' }, -- For ultisnips users.
                        { name = 'snippy' },    -- For snippy users.
                    },
                    {
                        { name = 'buffer' },
                    })
            }
        end


    },
    'hrsh7th/cmp-nvim-lsp',     -- LSP capabilities for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- Snippets plugin

}
