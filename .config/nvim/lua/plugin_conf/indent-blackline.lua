local status_ok, indent_blackline = pcall(require, 'ibl')

if not status_ok then
    print('indent-blackline.nvim is not working. Skipping...')
    return
end

indent_blackline.setup({
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
})
