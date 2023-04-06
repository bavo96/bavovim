local status_ok, gruvbox = pcall(require, 'gruvbox')

if not status_ok then
    print('gruvbox is not working. Skipping...')
    return
end

gruvbox.setup({
    transparent_mode = true
})

vim.opt.background = 'dark'
vim.cmd([[colorscheme gruvbox]])
