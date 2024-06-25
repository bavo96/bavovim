-- === Option for keymap ===
local opt = { noremap = true, silent = true }
-- Load dependencies for keymap
local builtin = require('telescope.builtin')

-- === MISC ===
-- Turn off highlighting when search files
vim.keymap.set('n', '<leader>a', ':noh<CR>', opt)
-- Turn off command history in vim
vim.keymap.set('n', 'q:', '<Nop>', opt)
vim.keymap.set('n', 'Q', '<Nop>', opt)
-- Tab block of code mutiple time
vim.keymap.set('v', '<Tab>', '>gv', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { silent = true })

-- === barbar.nvim ===
-- + Map control+q to quit buffer
vim.keymap.set('n', '<leader>q', '<Cmd>BufferClose<CR>', opt)
vim.keymap.set('n', '<leader>qa', '<Cmd>BufferCloseAllButCurrent<CR>', opt)
-- + Go to buffer by index
for i = 1, 10 do
    local key = '<leader>' .. i
    vim.keymap.set('n', key, '<Cmd>BufferGoto' .. i .. '<CR>', opt)
end

-- === Comment.nvim ===
-- + Map Ctrl+n to toggle comment in normal and visual mode
vim.keymap.set('n', '<C-n>', '<Plug>(comment_toggle_linewise_current)', opt)
vim.keymap.set('v', '<C-n>', '<Plug>(comment_toggle_linewise_visual)', opt)

-- === nvim-tree.lua ===
-- + Toggle nvim-tree
vim.keymap.set('n', '<C-p>', ':NvimTreeToggle<CR>', opt)
-- + navigation in Nvim-Tree
vim.keymap.set('n', '<C-h>', '<C-w>h', opt)
vim.keymap.set('n', '<C-l>', '<C-w>l', opt)
vim.keymap.set('n', '<C-j>', '<C-w>j', opt)
vim.keymap.set('n', '<C-k>', '<C-w>k', opt)

-- === lazy.nvim ===
vim.keymap.set('n', '<leader>ll', ':Lazy home<CR>', opt)

-- === telescope ===
vim.keymap.set('n', '<leader>ff', builtin.find_files, opt)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opt)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opt)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opt)

-- === toggleterm (maybe only use it for lazygit) ===
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', opt)
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- === lazygit ===
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- === Mason ===
vim.api.nvim_set_keymap("n", "<leader>ms", ":Mason<CR>", { noremap = true, silent = true })

-- === Neogen (docstrings) ===
vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').generate()<CR>", opt)

-- === ChatGPT ===
vim.api.nvim_set_keymap("n", "<Leader>cp", "<cmd>ChatGPT<CR>", opt)
local modes = { "n", "v" }
for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, "ct", "<cmd>ChatGPTRun translate<CR>", opt)
    vim.api.nvim_set_keymap(mode, "cs", "<cmd>ChatGPTRun summarize<CR>", opt)
    vim.api.nvim_set_keymap(mode, "cd", "<cmd>ChatGPTRun docstring<CR>", opt)
    vim.api.nvim_set_keymap(mode, "ce", "<cmd>ChatGPTRun explain_code<CR>", opt)
    vim.api.nvim_set_keymap(mode, "cf", "<cmd>ChatGPTRun fix_bugs<CR>", opt)
    vim.api.nvim_set_keymap(mode, "cg", "<cmd>ChatGPTRun grammar_correction<CR>", opt)
end

-- === Copilot ===
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- === image_preview.nvim ===
vim.keymap.set('n', '<leader>p', ':lua require("image_preview").preview()<CR>', opt)

-- === markdown-preview.nvim ===
vim.keymap.set('n', '<C-m>', '<Plug>MarkdownPreviewToggle', opt)
