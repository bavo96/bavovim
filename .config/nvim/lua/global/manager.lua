local function get_plugin_conf(name)
    return function()
        require('plugin_conf.' .. name)
    end
end

local function get_lsp_conf(name)
    return function()
        require('lsp.' .. name)
    end
end

return require('packer').startup({
    function(use)
        -- packer can manage itself
        use 'wbthomason/packer.nvim'

        -- nvim colorscheme
        use {
            'ellisonleao/gruvbox.nvim',
            config = get_plugin_conf('gruvbox')()
        }

        -- tabline (at the top)
        use {
            'romgrk/barbar.nvim',
            requires = 'nvim-web-devicons',
            config = get_plugin_conf('barbar')()
        }

        -- nvim tree
        use {
            'nvim-tree/nvim-tree.lua',
            config = get_plugin_conf('nvim-tree')()
        }

        -- nvim icons
        use 'nvim-tree/nvim-web-devicons'

        -- delete/change/add surrounding in pairs
        use 'tpope/vim-surround'

        -- auto create pairs for special characters
        use {
            'windwp/nvim-autopairs',
            config = get_plugin_conf('nvim-autopairs')()
        }

        -- comment in nvim
        use {
            'numToStr/Comment.nvim',
            config = get_plugin_conf('comment')()
        }

        -- lualine (at the bottom)
        use {
            'nvim-lualine/lualine.nvim',
            config = get_plugin_conf('lualine')()
        }

        -- show indentation
        use 'lukas-reineke/indent-blankline.nvim'

        -- code color (tree parsing)
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
            config = get_plugin_conf('nvim-treesitter')()
        }

        -- LSP servers, DAP servers, linters, and formatters.
        use {
            'williamboman/mason.nvim',
            run = function()
                local mason_update = require('mason.api.command')
                mason_update.MasonUpdate() -- :MasonUpdate updates registry contents
            end,
            config = get_lsp_conf('mason')(),
        }

        use {
            'williamboman/mason-lspconfig.nvim',
            config = get_lsp_conf('mason-lspconfig')(),
        }

        -- lspconfig
        use {
            'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
            config = get_lsp_conf('lspconfig')()
        }

        -- advanced lspconfig
        use {
            'jose-elias-alvarez/null-ls.nvim',
            config = get_lsp_conf('null-ls')()
        }

        -- autocomplete, snippet
        use { -- Autocompletion plugin
            'hrsh7th/nvim-cmp',
            config = get_lsp_conf('cmp')()

        }
        use 'hrsh7th/cmp-nvim-lsp'     -- LSP capabilities for nvim-cmp
        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip'         -- Snippets plugin

        -- TODO: highlight words 
        -- use {
        --     'rrethy/vim-illuminate',
        --     config = get_plugin_conf('vim-illuminate')(),
        -- }
        
        -- some utility functions for neovim plugin
        use "nvim-lua/plenary.nvim"

        -- find files in neovim
        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = get_plugin_conf('telescope')()
        }

        -- toggle terminal in neovim
        use {
            "akinsho/toggleterm.nvim",
            tag = '*',
            config = get_plugin_conf('toggleterm')()
        }

        -- show scrollbar in neovim
        use {
            "petertriho/nvim-scrollbar",
            config = get_plugin_conf('nvim-scrollbar')()
        }

        -- TODO: show image in neovim 

        -- TODO: git
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
