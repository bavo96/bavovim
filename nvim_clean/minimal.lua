vim.g.barbar_auto_setup = false

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
    -- open the tree but dont focus it
    require("nvim-tree.api").tree.toggle({ focus = false })
    -- Emit BufWinEnter
    vim.api.nvim_exec_autocmds('BufWinEnter', { buffer = require('nvim-tree.view').get_bufnr() })
end
vim.api.nvim_create_autocmd(
    { "VimEnter" },
    { callback = open_nvim_tree })
