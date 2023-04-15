local status_ok, scrollbar = pcall(require, 'scrollbar')

if not status_ok then
    print('nvim-autopairs is not working. Skipping...')
    return
end

scrollbar.setup {
}
