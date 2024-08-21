local indent = 4

-- Set key leader
vim.g.mapleader = " "

-- Set tab and indent (tab as space, not real tab)
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Turn off auto add a comment when newline
vim.opt.formatoptions:remove { 'ro' }

-- Set file format to unix to make sure endline is '\n'
vim.opt.fileformat = 'unix'

-- Show some invisible characters
vim.opt.list = true
-- vim.opt.listchars = { tab = '>~>' }
vim.opt.listchars = {
    tab = '>~',
    space = '·'
}

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Timeout for key sequences
vim.opt.timeoutlen = 300

-- Set static signcolumn (for errors, warnings, ...)
vim.opt.signcolumn = 'yes'

-- Set this to copy to clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- Remove tilde in neovim
vim.opt.fcs = 'eob: '

-- Set update time in vim
vim.o.updatetime = 250

-- Set max pattern when reading a file
vim.opt.mmp = 5000

-- Intelligibility configuration
vim.opt.scrolloff = 7
vim.opt.number = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.swapfile = false
vim.opt.mouse:append { a }
vim.opt.cursorline = true

-- Set modifiable to true
if vim.bo.modifiable then
    -- Your option setting code here
    vim.bo.modifiable = true
end

-- vim.opt.deno = '$HOME/.deno/bin/deno'
