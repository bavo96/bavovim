local status_ok, gruvbox = pcall(require, 'gruvbox')

if not status_ok then
    print('gruvbox is not working. Skipping...')
    return
end

-- setup must be called before loading the colorscheme
-- Default options:
gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        CursorLine = { bg = '#282828' }, -- Change cursor color
        Search = { fg = '#458588' },
        LspReferenceText = { bg = '#504945' },
        LspReferenceRead = { bg = '#504945' },
        LspReferenceWrite = { bg = '#504945' }
    },
    dim_inactive = false,
    transparent_mode = true,
})

vim.opt.background = 'dark'

vim.cmd([[colorscheme gruvbox]])
