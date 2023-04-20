-- Load nvim-cmp
local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
    print('nvim-cmp is not working. Skipping...')
    return
end

-- Load LuaSnip
local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
    print('LuaSnip is not working. Skipping...')
    return
end

-- Autocompletion
-- nvim-cmp setup
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
