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
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename', 'filesize', function()
                        local current_buf = 'current_buf: ' .. vim.api.nvim_get_current_buf()
                        return current_buf
                    end },
                    lualine_x = { 'encoding' },

                    lualine_y = {
                        function() -- Get total line in file
                            local total_line_info = 'total_line: ' .. vim.fn.line('$')
                            return total_line_info
                        end,
                        'progress' -- Progress bar
                    },
                    lualine_z = { 'location' }
                }

            })
    end
}
