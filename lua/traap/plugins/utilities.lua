return {
  -- {{{ General startup

  { 'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  { 'nvim-lua/plenary.nvim', lazy = true },

  { 'nvim-lua/popup.nvim', event = 'VimEnter' },

  { 'folke/trouble.nvim', event = 'VimEnter', 
     opts = {use_diagnostic_signs = true }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ JuneGunn Easyalign and fzf.

  { 'junegunn/vim-easy-align', event = 'BufEnter' },
  { 'junegunn/fzf', event = 'BufEnter',
    dependencies = {
      'junegunn/fzf.vim',
      'Traap/vim-bundle-fzf',
    }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ PlantUML

  { 'aklt/plantuml-syntax', 
    keys = '<leader>gu',
    dependencies = 'Traap/vim-bundle-plantuml',
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ neovim without Tpope?  No Way!!!

  { 'tpope/gem-browse',        event = 'BufEnter' },
  { 'tpope/vim-bundler',       event = 'BufEnter' },
  { 'tpope/vim-characterize',  event = 'BufEnter' },
  { 'tpope/vim-commentary',    event = 'BufEnter'},
  { 'tpope/vim-dispatch',      event = 'VeryLazy' },
  { 'tpope/vim-endwise',       event = 'BufEnter' },
  { 'tpope/vim-eunuch',        event = 'BufEnter' },
  { 'tpope/vim-fugitive',      event = 'BufEnter' },
  { 'tpope/vim-projectionist', event = 'VeryLazy' },
  { 'tpope/vim-rails',         event = 'VeryLazy' },
  { 'tpope/vim-rake',          event = 'VeryLazy' },
  { 'tpope/vim-rbenv',         event = 'VeryLazy' },
  { 'tpope/vim-repeat',        event = 'VeryLazy' },
--  { 'tpope/vim-surround',      event = 'BufEnter' },
  { 'tpope/vim-unimpaired',    event = 'BufEnter' },
  { 'tpope/vim-vinegar',       event = 'BufEnter' },

  { 'kylechui/nvim-surround', event = 'BufEnter', config=true },

  -------------------------------------------------------------------------- }}}
  -- {{{ Tmux

  { 'christoomey/vim-tmux-navigator',
    cmd = 'VtrOpenRunner',
    dependencies = {
      'christoomey/vim-tmux-runner',
      'Traap/vim-bundle-tmux-runner'
    },
  },

  -- ----------------------------------------------------------------------- }}}
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
        {background_colour = '#000000'}
      }
    end,
  },

  { 'sbdchd/neoformat',                   event = 'BufEnter' },
  { 'triglav/vim-visual-increment',       event = 'BufEnter' },
  { 'vim-utils/vim-most-minimal-folds',   event = 'BufEnter' },
  { 'windwp/nvim-autopairs',              event = 'BufEnter', config = true },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ VimTex

  { 'lervag/vimtex', event = 'BufEnter',
     dependencies = { 'Traap/vim-bundle-vimtex'},
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Wiki.Vim

  { 'lervag/wiki-ft.vim', lazy = false },

  { 'lervag/wiki.vim',
    cmd = 'WikiIndex',
    dependencies = {
      'Traap/vim-bundle-wiki.vim',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ DAP

  { 'mfussenegger/nvim-dap',
    event = 'BufEnter',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git signs and lightbulb.

  { 'lewis6991/gitsigns.nvim', event = 'BufEnter', enable = true},
  { 'kosayoda/nvim-lightbulb',
    event = 'BufEnter',
    opts = { autocmd = {enabled = true } },
    dependencies = { 'antoinemadec/FixCursorHold.nvim', }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Zulu : Reuse Traap's vim bundles last.

  { 'Traap/vim-bundle-abbreviate', event = 'BufEnter' },

  -- ----------------------------------------------------------------------- }}}
}
