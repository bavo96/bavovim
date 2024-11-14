-- nvim tree
return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local options = {
            filters = {
                dotfiles = false,
                git_ignored = false
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
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
            },
            filesystem_watchers = {
                enable = true,
                debounce_delay = 50,
                ignore_dirs = {},
            },
            git = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                disable_for_dirs = {},
                timeout = 400,
            },
            prefer_startup_root = true,
            actions = {
                open_file = {
                    resize_window = false
                }
            }
        }

        -- setup with some options
        require("nvim-tree").setup(options)

        -- auto open nvim-tree when open neovim
        local function open_nvim_tree(data)
            -- buffer is a real file on the disk
            local real_file = vim.fn.filereadable(data.file) == 1

            -- buffer is a [No Name]
            local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

            -- only files please
            if not real_file and not no_name then
                return
            end
            -- open the tree but don't focus it
            require("nvim-tree.api").tree.toggle({ focus = false })
            -- Emit BufWinEnter
            vim.api.nvim_exec_autocmds('BufWinEnter', { buffer = require('nvim-tree.view').get_bufnr() })
        end
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = open_nvim_tree
        })

        -- auto close nvim-tree
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
            pattern = "NvimTree_*",
            callback = function()
                local layout = vim.api.nvim_call_function("winlayout", {})
                if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
                    vim.cmd("confirm quit")
                end
            end
        })
    end
}
