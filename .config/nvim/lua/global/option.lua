local indent = 2

-- Set key leader
vim.g.mapleader = " "

-- Set tab and indent
vim.opt.expandtab = true
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth= indent
vim.opt.autoindent = true

-- Turn off auto add a comment when newline
vim.opt.formatoptions:remove { ro }

-- Set file format to unix to make sure endline is '\n'
vim.opt.fileformat = 'unix'

-- Show some invisible characters
vim.opt.list = true

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Timeout for key sequences
vim.opt.timeoutlen = 200

-- Set static signcolumn (for errors, warnings, ...)
vim.opt.signcolumn = 'yes'

-- Intelligibility configuration
vim.opt.scrolloff = 7
vim.opt.number = true
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.swapfile = false
vim.opt.mouse:append { a }

-- vim.opt.deno = '$HOME/.deno/bin/deno'

