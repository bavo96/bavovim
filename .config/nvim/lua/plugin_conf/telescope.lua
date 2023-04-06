local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
    print('telescope is not working. Skipping...')
    return
end

require('telescope').setup {
}
