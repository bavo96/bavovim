-- show indentation
return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("ibl").setup({
            indent = {
                char = "▏",
                smart_indent_cap = true,
                priority = 0
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
        }
        )
    end
}
