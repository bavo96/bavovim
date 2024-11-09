return {
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- 'brianhuster/autosave.nvim',  -- Not required, but recomended for autosaving and sync scrolling

        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        cmd = "LivePreview",
        port = 5500,
        autokill = true,
        browser = 'default',
        dynamic_root = true,
        sync_scroll = false,
        picker = 'telescope'
    }
}
