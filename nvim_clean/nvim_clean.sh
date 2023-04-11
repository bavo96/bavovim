nvim --clean  \
     --cmd 'set rtp+=~/.local/share/nvim/site/pack/packer/start/barbar.nvim' \
     --cmd 'set rtp+=~/.local/share/nvim/site/pack/packer/start/nvim-tree.lua' \
     --cmd 'set rtp+=~/.local/share/nvim/site/pack/packer/start/nvim-web-devicons' \
     --cmd 'lua require"bufferline".setup{ 
         -- Enable/disable animations
        animation = true,

        -- Icons in barbar
        icons = {
            -- Configure the base icons on the bufferline.
            buffer_index = true, -- Index according to visual index on the screen not the background number of buffer
        },
        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            NvimTree = true,
        },
 }' \
     --cmd 'lua require"nvim-tree".setup{
        filters = {
            dotfiles = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
 }' \
     -u minimal.lua
