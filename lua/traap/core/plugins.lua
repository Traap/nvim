-- {{{ Lazy setup

require('lazy').setup({

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

  'nvim-lua/popup.nvim',
  'lewis6991/impatient.nvim',
  'folke/trouble.nvim',

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

  'RRethy/nvim-base16',
  'norcalli/nvim-colorizer.lua',
  'mechatroner/rainbow_csv',

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP & DAP

  { 'neovim/nvim-lspconfig', dependencies = {
    -- LSP Support
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-path',
    'f3fora/cmp-spell',

    -- Useful status updates for LSP
    'j-hui/fidget.nvim',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
    'benfowler/telescope-luasnip.nvim',
   }
 },

  { 'mfussenegger/nvim-dap', dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    }
  },


-- ------------------------------------------------------------------------- }}}
-- {{{ JuneGunn Easyalign and fzf.

  'junegunn/vim-easy-align',
  'junegunn/fzf',
  'junegunn/fzf.vim',

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

  { 'kyazdani42/nvim-tree.lua', dependencies = {
    'ahmedkhalf/project.nvim',
    }
  },

  { 'nvim-lualine/lualine.nvim', dependencies = {
    'kyazdani42/nvim-web-devicons', opt = true }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Git signs and lightbulb.

  'lewis6991/gitsigns.nvim',
  { 'kosayoda/nvim-lightbulb', dependencies = {
    'antoinemadec/FixCursorHold.nvim',
    }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

  'tweekmonster/startuptime.vim',

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

  'aklt/plantuml-syntax',

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

  'tpope/gem-browse',
  'tpope/vim-bundler',
  'tpope/vim-characterize',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  'tpope/vim-endwise',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-projectionist',
  'tpope/vim-rails',
  'tpope/vim-rake',
  'tpope/vim-rbenv',
  'tpope/vim-repeat',
  -- 'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tpope/vim-vinegar',

  'kylechui/nvim-surround',

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

  { 'nvim-telescope/telescope.nvim', dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'nvim-telescope/telescope-media-files.nvim' ,
      'nvim-lua/plenary.nvim',
    }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

  { 'christoomey/vim-tmux-navigator', dependencies =
    'christoomey/vim-tmux-runner',
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

  'ThePrimeagen/harpoon',
  'ekickx/clipboard-image.nvim',
  -- 'goolord/alpha-nvim',
  'iamcco/markdown-preview.nvim',
  'kovetskiy/sxhkd-vim',
  'moll/vim-bbye',
  'sbdchd/neoformat',
  'triglav/vim-visual-increment',
  'vim-utils/vim-most-minimal-folds',
  'windwp/nvim-autopairs',
  'xiyaowong/nvim-transparent',
  'ChristianChiarulli/nvim-ts-rainbow',

-- ------------------------------------------------------------------------- }}}
-- {{{ Notification.

  'rcarriga/nvim-notify',

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

  'lervag/vimtex',

  -- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

  { 'lervag/wiki.vim', dependencies = {
    'dkarter/bullets.vim',
    'lervag/wiki-ft.vim'
    }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Which-Key

  -- 'folke/which-key.nvim',

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

  'Traap/vim-bundle-abbreviate',
  'Traap/vim-bundle-fzf',
  'Traap/vim-bundle-plantuml',
  'Traap/vim-bundle-tmux-runner',
  'Traap/vim-bundle-vimtex',
  'Traap/vim-bundle-wiki.vim',
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

-- if vim.g.nvim_bootstrapped == 1 then
--   lazy.
-- end

-- ------------------------------------------------------------------------- }}}
