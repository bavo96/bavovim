local lazypath = "/tmp/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath }
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

require("lazy").setup({
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup {
                indent = {
                    char = "▏",
                    tab_char = "*",
                    smart_indent_cap = true,
                },
                -- whitespace = { highlight = { "Whitespace", "NonText" } },
                -- whitespace = { highlight = { "Function", "Label" } },
                scope = {
                    enabled = true,
                    show_start = false,
                    show_end = false,
                },

            }
        end,
    },
    -- uncomment this if the problem is related to scope
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     build = ":TSUpdate",
    --     config = function()
    --         require("nvim-treesitter.configs").setup {
    --             ensure_installed = { "rust" }, -- change this to the language you use
    --         }
    --     end,
    -- },
}, { root = "/tmp/lazy" })
