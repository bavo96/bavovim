-- Turn off highlighting when search files
vim.keymap.set('n', '<space>', ':noh<CR>')

-- barbar.nvim
-- + Map control+q to quit buffer
vim.keymap.set('n', '<C-q>', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})

-- Comment.nvim
-- + Map Ctrl+n to toggle comment in normal and visual mode
vim.keymap.set('n', '<C-n>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('v', '<C-n>', '<Plug>(comment_toggle_linewise_visual)')

-- nvim-tree.lua
-- + Toggle nvim-tree
vim.keymap.set('n', '<C-p>', ':NvimTreeToggle<CR>') 
-- + navigation in Nvim-Tree
vim.keymap.set('n', '<C-h>', ':NvimTreeFocus<CR><C-w>h', { silent = true }) 
vim.keymap.set('n', '<C-l>', ':NvimTreeFocus<CR><C-w>l', { silent = true }) 
vim.keymap.set('n', '<C-j>', ':NvimTreeFocus<CR><C-w>j', { silent = true }) 
vim.keymap.set('n', '<C-k>', ':NvimTreeFocus<CR><C-w>k', { silent = true }) 
