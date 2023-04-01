local opt = { noremap = true, silent = true }

-- Turn off highlighting when search files
vim.keymap.set('n', '<leader>f', ':noh<CR>', opt)

-- barbar.nvim
-- + Map control+q to quit buffer
vim.keymap.set('n', '<leader>q', '<Cmd>BufferClose<CR>', opt)
vim.keymap.set('n', '<leader>aq', '<Cmd>BufferCloseAllButCurrent<CR>', opt)
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)

-- Comment.nvim
-- + Map Ctrl+n to toggle comment in normal and visual mode
vim.keymap.set('n', '<C-n>', '<Plug>(comment_toggle_linewise_current)', opt)
vim.keymap.set('v', '<C-n>', '<Plug>(comment_toggle_linewise_visual)', opt)

-- nvim-tree.lua
-- + Toggle nvim-tree
vim.keymap.set('n', '<C-p>', ':NvimTreeToggle<CR>', opt) 
-- + navigation in Nvim-Tree
vim.keymap.set('n', '<C-h>', ':NvimTreeFocus<CR><C-w>h', opt) 
vim.keymap.set('n', '<C-l>', ':NvimTreeFocus<CR><C-w>l', opt) 
vim.keymap.set('n', '<C-j>', ':NvimTreeFocus<CR><C-w>j', opt) 
vim.keymap.set('n', '<C-k>', ':NvimTreeFocus<CR><C-w>k', opt) 

-- Packer
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>', opt)
