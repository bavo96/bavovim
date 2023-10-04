local status_ok, indent_blackline = pcall(require, 'ibl')

if not status_ok then
    print('indent-blackline.nvim is not working. Skipping...')
    return
end
indent_blackline.setup()
