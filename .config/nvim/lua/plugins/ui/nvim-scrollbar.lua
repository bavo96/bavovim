-- show scrollbar in neovim
return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup({
            excluded_filetypes = { 'NvimTree' }
        })
    end
}
