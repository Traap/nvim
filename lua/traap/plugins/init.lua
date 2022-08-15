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
  max_jobs = 20,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer startup function definition.

return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'folke/trouble.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

  use { 'RRethy/nvim-base16' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'mechatroner/rainbow_csv' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-document-symbol' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-path' }
  use { 'onsails/lspkind-nvim' }
  use { 'f3fora/cmp-spell' }

-- ------------------------------------------------------------------------- }}}
-- {{{ JuneGunn Easyalign and fzf.

  use { 'junegunn/vim-easy-align' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

  use { 'kyazdani42/nvim-tree.lua' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
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

  use { 'kovetskiy/sxhkd-vim' }
  use { 'tpope/vim-characterize' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-unimpaired' }
  use { 'kylechui/nvim-surround' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-media-files.nvim' },
    }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

  use { 'nvim-treesitter/nvim-treesitter' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

  use { 'christoomey/vim-tmux-navigator',
    requires = {'christoomey/vim-tmux-runner' }
  }

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

  use { 'ekickx/clipboard-image.nvim' }
  use { 'goolord/alpha-nvim' }
  use { 'iamcco/markdown-preview.nvim' }
  use { 'moll/vim-bbye' }
  use { 'sbdchd/neoformat' }
  use { 'triglav/vim-visual-increment' }
  use { 'vim-utils/vim-most-minimal-folds' }
  use { 'xiyaowong/nvim-transparent' }
  use { 'windwp/nvim-autopairs' }

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

  use { 'folke/which-key.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Snippets

  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'benfowler/telescope-luasnip.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

  use { 'Traap/vim-bundle-abbreviate' }
  use { 'Traap/vim-bundle-autocmd' }
  use { 'Traap/vim-bundle-fzf' }
  use { 'Traap/vim-bundle-plantuml' }
  use { 'Traap/vim-bundle-rainbow' }
  use { 'Traap/vim-bundle-tmux-runner' }
  use { 'Traap/vim-bundle-vimtex' }
  use { 'Traap/vim-bundle-vimwiki' }

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

  if vim.g.nvim_bootstrapped == 1 then
    packer.sync()
  end

-- ------------------------------------------------------------------------- }}}
-- {{{ The END!

end)

-- ------------------------------------------------------------------------- }}}
