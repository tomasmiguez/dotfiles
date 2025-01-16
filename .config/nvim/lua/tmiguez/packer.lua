-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lua cache
  use 'lewis6991/impatient.nvim'

  -- Functionality
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('nvim-tree').setup() end
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    run = 'make'
    -- Additional dependencies:
    -- ripgrep fzf fd
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use {
    'kristijanhusak/vim-dadbod-ui',
    requires = {
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-completion' },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    run = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
  use {
    'shumphrey/fugitive-gitlab.vim',
    requires = 'tpope/vim-fugitive'
  }
  use {
    'tpope/vim-rhubarb',
    requires = 'tpope/vim-fugitive'
  }
  use 'qpkorr/vim-bufkill'
  use 'kassio/neoterm'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    -- Additional dependencies:
    -- tar curl git
  }
  use { 'szw/vim-maximizer' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
    -- Additional dependencies:
    -- git curl wget unzip tar gzip
  }
  use 'mfussenegger/nvim-dap'
  use {
    'suketa/nvim-dap-ruby',
    config = function() require('dap-ruby').setup() end
  }
  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      { 'mfussenegger/nvim-dap' },
      { 'nvim-neotest/nvim-nio' },
      { 'suketa/nvim-dap-ruby' },
    },
    config = function() require("dapui").setup() end
  }
  use {
    'mfussenegger/nvim-dap-python',
    config = function() require('dap-python').setup('~/.virtualenvs/debugpy/bin/python') end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup({}) end
  }
  use {
    'ggandor/leap.nvim',
    config = function() require('leap').create_default_mappings() end
  }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'arthurxavierx/vim-caser'
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use 'uga-rosa/translate.nvim'
  use {
    'lervag/vimtex',
    config = function ()
      vim.g.vimtex_view_method = 'zathura'
    end
  }
  use 'danchoi/ri.vim'
  -- use 'hotwatermorning/auto-git-diff'

  -- Appearance
  -- use {
  --   'krivahtoo/silicon.nvim',
  --   run = './install.sh',
  --   config = function() require('silicon').setup { font = 'Iosevka Term=20', theme = 'Dracula' } end
  -- }
  use 'hoob3rt/lualine.nvim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require("ibl").setup() end
  }
  use  'xiyaowong/nvim-transparent'
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
  use { 'dracula/vim', as = 'dracula' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  use {
    "folke/noice.nvim",
    event = "VimEnter",
    requires = { "MunifTanjim/nui.nvim" }
  }
end)
