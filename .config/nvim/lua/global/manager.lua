function get_plugin_conf(name)
  return function()
    require('plugin_conf.'.. name)
  end
end

return require('packer').startup({function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nvim colorscheme
  use {
	  'ellisonleao/gruvbox.nvim',
	  config = get_plugin_conf('gruvbox')()
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
  use 'jiangmiao/auto-pairs'

  -- comment in nvim
  use {
    'numToStr/Comment.nvim',
	  config = get_plugin_conf('comment')()
  }

  -- tabline (at the top)
  use {
	  'romgrk/barbar.nvim',
    requires = 'nvim-web-devicons',
	  config = get_plugin_conf('barbar')()
  }

  -- vim airline (at the bottom)
  use {
	  'vim-airline/vim-airline',
	  config = get_plugin_conf('vim-airline')()
  }
  use 'vim-airline/vim-airline-themes'

  -- show indentation
  use 'lukas-reineke/indent-blankline.nvim'

  -- code color (tree parsing)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_plugin_conf('nvim-treesitter')()
  }
    
  -- lspconfig 
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- autocomplete
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- git
  -- TODO: pass

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})



