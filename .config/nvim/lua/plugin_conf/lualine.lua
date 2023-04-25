local status_ok, lualine = pcall(require, 'lualine')

if not status_ok then
    print('lualine is not working. Skipping...')
    return
end

lualine.setup {
    options = {
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        },
        theme = 'gruvbox'
    },
    sections = {
        lualine_y = {
            function() -- Total line in file
                return vim.fn.line('$')
            end,
            'progress' -- Progress bar
        }
    }

}
