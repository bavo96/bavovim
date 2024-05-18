-- lualine (at the bottom)
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup(
            {
                options = {
                    disabled_filetypes = {
                        statusline = { 'NvimTree' }
                    },
                    theme = 'gruvbox'
                },
                sections = {
                    lualine_y = {
                        function() -- Total line in file
                            return vim.fn.line('$')
                        end,
                        'progress' -- Progress bar
                    }
                }

            })
    end
}
