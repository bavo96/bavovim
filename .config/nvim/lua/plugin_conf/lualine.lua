local status_ok, lualine = pcall(require, 'lualine')

if not status_ok then
    print('lualine is not working. Skipping...')
    return
end

lualine.setup {
    options = {
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        }
    }

}
