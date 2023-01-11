-- {{{ Use protected call so we don't error on first use.

local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Have packer use a popup window

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  max_jobs = 50,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer startup function definition.

return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'folke/trouble.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

  use { 'RRethy/nvim-base16' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'mechatroner/rainbow_csv' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Easy LSP with lsp-zero

  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'jayp0521/mason-null-ls.nvim'},

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
      { 'hrsh7th/cmp-path' },
      { 'f3fora/cmp-spell' },

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip'},
      { 'rafamadriz/friendly-snippets'},
      { 'saadparwaiz1/cmp_luasnip' },
      { 'benfowler/telescope-luasnip.nvim' },
    }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ JuneGunn Easyalign and fzf.

  use { 'junegunn/vim-easy-align' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'ahmedkhalf/project.nvim' },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Git signs and lightbulb.

  use { 'lewis6991/gitsigns.nvim' }
  use { 'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

  use { 'tweekmonster/startuptime.vim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

  use { 'aklt/plantuml-syntax' }

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

  use { 'tpope/gem-browse' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-characterize' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-projectionist' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-rake' }
  use { 'tpope/vim-rbenv' }
  use { 'tpope/vim-repeat' }
  -- use { 'tpope/vim-surround' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-vinegar' }

  use { 'kylechui/nvim-surround' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-media-files.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

  use { 'christoomey/vim-tmux-navigator',
    requires = {'christoomey/vim-tmux-runner' }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

  use { 'ThePrimeagen/harpoon' }
  use { 'ekickx/clipboard-image.nvim' }
  -- use { 'goolord/alpha-nvim' }
  use { 'iamcco/markdown-preview.nvim' }
  use { 'kovetskiy/sxhkd-vim' }
  use { 'moll/vim-bbye' }
  use { 'sbdchd/neoformat' }
  use { 'triglav/vim-visual-increment' }
  use { 'vim-utils/vim-most-minimal-folds' }
  use { 'windwp/nvim-autopairs' }
  use { 'xiyaowong/nvim-transparent' }
  use { 'ChristianChiarulli/nvim-ts-rainbow' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Notification.

  use { 'rcarriga/nvim-notify' }

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

  use { 'lervag/vimtex' }

  -- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

  use { 'lervag/wiki.vim',
    requires = {
      'dkarter/bullets.vim',
      'lervag/wiki-ft.vim'
    }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Which-Key

  -- use { 'folke/which-key.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

  use { 'Traap/vim-bundle-abbreviate' }
  use { 'Traap/vim-bundle-fzf' }
  use { 'Traap/vim-bundle-plantuml' }
  use { 'Traap/vim-bundle-tmux-runner' }
  use { 'Traap/vim-bundle-vimtex' }
  use { 'Traap/vim-bundle-wiki.vim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

  if vim.g.nvim_bootstrapped == 1 then
    packer.sync()
  end

-- ------------------------------------------------------------------------- }}}
-- {{{ The END!

end)

-- ------------------------------------------------------------------------- }}}
