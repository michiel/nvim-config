-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use { 
    'lukas-reineke/indent-blankline.nvim',
     config = function()

       vim.opt.list = true
       vim.opt.listchars:append("space:⋅")
       vim.opt.listchars:append("eol:↴")

       require('indent_blankline').setup {
         show_current_context = true,
         show_current_context_start = true,
         show_end_of_line = true,
         space_char_blankline = " ",
      -- char_highlight_list = {
      --    "IndentBlanklineIndent1",
      --    "IndentBlanklineIndent2",
      --    "IndentBlanklineIndent3",
      --    "IndentBlanklineIndent4",
      --    "IndentBlanklineIndent5",
      --    "IndentBlanklineIndent6",
      --  },
       }
     end
  }

  use 'tpope/vim-fugitive'
  use 'gelguy/wilder.nvim'
  use 'EdenEast/nightfox.nvim'
  --use {
  --  'rcarriga/nvim-notify',
  --  config = function()
  --    -- vim.notify = require("notify")
  --  end
  --}

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- You can specify multiple plugins in a single call
  use 'tjdevries/colorbuddy.vim'

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji',
      'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip'
		}
	}
	use {
		'tzachar/cmp-tabnine',
		run = './install.sh',
		requires = 'hrsh7th/nvim-cmp'
	}
end)
