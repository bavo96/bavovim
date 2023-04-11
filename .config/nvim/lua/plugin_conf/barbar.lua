local status_ok, barbar = pcall(require, 'barbar')

if not status_ok then
    print('barbar is not working. Skipping...')
    return
end

vim.g.barbar_auto_setup = false -- disable auto-setup

-- Set barbar's options
barbar.setup {
    -- Enable/disable animations
    animation = true,

    -- Icons in barbar
    icons = {
        -- Configure the base icons on the bufferline.
        buffer_index = true, -- Index according to visual index on the screen not the background number of buffer
    },
    -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = true,
    },
}
