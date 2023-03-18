
-- SETTING FOR NVIM COLOR (GRUVBOX)
require("gruvbox").setup({
  transparent_mode = true,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

-- SETTING FOR LSPCONFIG
