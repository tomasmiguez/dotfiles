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
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v2.*',
    run = 'make install_jsregexp',
  }
  use 'saadparwaiz1/cmp_luasnip'
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
    commit = '5ae080b646021bbb6e1d8715b155b1e633e28166',
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

  -- Appearance
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
