-- {{{ Lazy setup

require('lazy').setup({

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

  'nvim-lua/popup.nvim',
  'folke/trouble.nvim',

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

  'RRethy/nvim-base16',
  { 'norcalli/nvim-colorizer.lua', event = VeryLazy, config = true},
  'mechatroner/rainbow_csv',

-- ------------------------------------------------------------------------- }}}
-- {{{ DAP

  { 'mfussenegger/nvim-dap', 
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Autocompletion

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
    },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ JuneGunn Easyalign and fzf.

  { 'junegunn/vim-easy-align', event = 'VeryLazy' },
  { 'junegunn/fzf', event = 'VeryLazy' },
  { 'junegunn/fzf.vim', event = 'VeryLazy' },

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

  { 'kyazdani42/nvim-tree.lua', event = 'VeryLazy',
    dependencies = { 'ahmedkhalf/project.nvim', config = true }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Satus line 

  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', config = true,
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Git signs and lightbulb.

  { 'lewis6991/gitsigns.nvim', event = 'VeryLazy', config = true},
  { 'kosayoda/nvim-lightbulb', 
    event = 'VeryLazy',
    opts = function() 
      return {
        { autocmd = {enabled = true }}
      }
    end,
    dependencies = { 'antoinemadec/FixCursorHold.nvim', }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

  'tweekmonster/startuptime.vim',

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

  { 'aklt/plantuml-syntax', event = 'VeryLazy' },

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

  { 'tpope/gem-browse', event = 'VeryLazy' },
  { 'tpope/vim-bundler', event = 'VeryLazy' },
  { 'tpope/vim-characterize', event = 'VeryLazy' },
  { 'tpope/vim-commentary', event = 'VeryLazy'},
  { 'tpope/vim-dispatch', event = 'VeryLazy' },
  { 'tpope/vim-endwise', event = 'VeryLazy' },
  { 'tpope/vim-eunuch', event = 'VeryLazy' },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'tpope/vim-projectionist', event = 'VeryLazy' },
  { 'tpope/vim-rails', event = 'VeryLazy' },
  { 'tpope/vim-rake', event = 'VeryLazy' },
  { 'tpope/vim-rbenv', event = 'VeryLazy' },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  -- { 'tpope/vim-surround', event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'tpope/vim-vinegar', event = 'VeryLazy' },

  { 'kylechui/nvim-surround', event = 'VeryLazy' },

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

  { 'nvim-telescope/telescope.nvim',
    lazy=true,
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'nvim-telescope/telescope-media-files.nvim' ,
      'nvim-lua/plenary.nvim',
    },
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
    'nvim-treesitter/playground', after = 'nvim-treesitter',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter',
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

  { 'christoomey/vim-tmux-navigator', 
    event = 'VeryLazy',
    dependencies = 'christoomey/vim-tmux-runner',
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

  { 'ChristianChiarulli/nvim-ts-rainbow', event = 'BufEnter' },
  { 'ThePrimeagen/harpoon',               event = 'BufEnter' },
  { 'dkarter/bullets.vim',                event = 'BufEnter' },
  { 'ekickx/clipboard-image.nvim',        event = 'BufEnter' },
  { 'goolord/alpha-nvim',                 event = 'BufEnter' },
  { 'iamcco/markdown-preview.nvim',       event = 'BufEnter' },
  { 'kovetskiy/sxhkd-vim',                event = 'BufEnter' },
  { 'moll/vim-bbye',                      event = 'BufEnter' },

  { 'rcarriga/nvim-notify', event = 'BufEnter',
    opts = function() 
      return { 
        {background_colour = "#000000"}
      }
    end,
  },

  { 'sbdchd/neoformat',                   event = 'BufEnter' },
  { 'triglav/vim-visual-increment',       event = 'BufEnter' },
  { 'vim-utils/vim-most-minimal-folds',   event = 'BufEnter' },
  { 'windwp/nvim-autopairs',              event = 'BufEnter', config = true },
  { 'xiyaowong/nvim-transparent',         event = 'BufEnter' },

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

  { 'lervag/vimtex', event = 'BufEnter' },

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

  { 'lervag/wiki.vim', event = 'BufEnter',
    dependencies = { 'lervag/wiki-ft.vim' }
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Which-Key

-- 'folke/which-key.nvim',

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

  { 'Traap/vim-bundle-abbreviate', event = 'VeryLazy' },
  { 'Traap/vim-bundle-fzf',        event = 'VeryLazy' },
  { 'Traap/vim-bundle-plantuml',   event = 'VeryLazy' },
  { 'Traap/vim-bundle-tmux-runner',event = 'VeryLazy' },
  { 'Traap/vim-bundle-vimtex',     event = 'VeryLazy' },
  { 'Traap/vim-bundle-wiki.vim',   event = 'VeryLazy' },
  
})

-- ------------------------------------------------------------------------- }}}
