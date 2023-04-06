

-- Option for keymap
local opt = { noremap = true, silent = true }
-- Load dependencies for keymap
local builtin = require('telescope.builtin')

-- Custom function
local function get_map()
  normal_mappings = vim.api.nvim_get_keymap('n')
  visual_mappings = vim.api.nvim_get_keymap('v')
  insert_mappings = vim.api.nvim_get_keymap('i')
  return normal_mappings
end

-- for key, value in pairs(get_map()) do 
--   print(key, value)
-- end

-- -- Write the mappings to a file
-- local file = expand("~/.vim/mappings.log")
-- call writefile(split(mappings, "\n"), file)

-- Turn off highlighting when search files
vim.keymap.set('n', '<leader>f', ':noh<CR>', opt)

-- barbar.nvim
-- + Map control+q to quit buffer
vim.keymap.set('n', '<leader>q', '<Cmd>BufferClose<CR>', opt)
vim.keymap.set('n', '<leader>aq', '<Cmd>BufferCloseAllButCurrent<CR>', opt)
-- + Go to buffer by index
for i = 1, 10 do
  local key = '<leader>' .. i
  vim.keymap.set('n', key, '<Cmd>BufferGoto'.. i .. '<CR>', opts)
end

-- Comment.nvim
-- + Map Ctrl+n to toggle comment in normal and visual mode
vim.keymap.set('n', '<C-n>', '<Plug>(comment_toggle_linewise_current)', opt)
vim.keymap.set('v', '<C-n>', '<Plug>(comment_toggle_linewise_visual)', opt)

-- nvim-tree.lua
-- + Toggle nvim-tree
vim.keymap.set('n', '<C-p>', ':NvimTreeToggle<CR>', opt) 
-- + navigation in Nvim-Tree
vim.keymap.set('n', '<C-h>', '<C-w>h', opt) 
vim.keymap.set('n', '<C-l>', '<C-w>l', opt) 
vim.keymap.set('n', '<C-j>', '<C-w>j', opt) 
vim.keymap.set('n', '<C-k>', '<C-w>k', opt) 

-- packer
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>', opt)

-- telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, opt)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opt)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opt)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opt)

-- toggleterm (maybe only use it for lazygit)
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', opt)
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- lazygit
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Mason
vim.api.nvim_set_keymap("n", "<leader>ms", ":Mason<CR>", {noremap = true, silent = true})








