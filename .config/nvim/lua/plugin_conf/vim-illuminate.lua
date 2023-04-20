local status_ok, illuminate = pcall(require, 'illuminate')
if not status_ok then
    print('vim-illuminate is not working. Skipping...')
    return
end

illuminate.configure {
    filetypes_denylist = {
        'NvimTree'
    },
    delay = 100,
}

vim.cmd("hi IlluminatedWordRead guibg=#525252")
