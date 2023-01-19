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
  -- {{{ Lualine

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = true
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ PlantUML

  { 'aklt/plantuml-syntax',
    keys = '<leader>gu',
    dependencies = 'Traap/vim-bundle-plantuml',
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neovim without Tpope?  No Way!!!

  { 'tpope/gem-browse',        event = 'VeryLazy' },
  { 'tpope/vim-bundler',       event = 'VeryLazy' },
  { 'tpope/vim-characterize',  event = 'VeryLazy' },
  { 'tpope/vim-commentary',    event = 'VeryLazy'},
  { 'tpope/vim-dispatch',      event = 'VeryLazy' },
  { 'tpope/vim-endwise',       event = 'InsertEnter' },
  { 'tpope/vim-eunuch',        event = 'VeryLazy' },
  { 'tpope/vim-fugitive',      event = 'VeryLazy' },
  { 'tpope/vim-projectionist', event = 'VeryLazy' },
  { 'tpope/vim-rails',         event = 'VeryLazy' },
  { 'tpope/vim-rake',          event = 'VeryLazy' },
  { 'tpope/vim-rbenv',         event = 'VeryLazy' },
  { 'tpope/vim-repeat',        event = 'VeryLazy' },
--  { 'tpope/vim-surround',      event = 'BufEnter' },
  { 'tpope/vim-unimpaired',    event = 'VeryLazy' },
  { 'tpope/vim-vinegar',       event = 'VeryLazy' },

  { 'kylechui/nvim-surround', event = 'BufEnter', config=true },

  -------------------------------------------------------------------------- }}}
  -- {{{ Navigate Vim Splits and Tmux pains.

  { 'christoomey/vim-tmux-navigator', event = 'BufEnter '},

  -------------------------------------------------------------------------- }}}
  -- {{{ Tmux

  { 'christoomey/vim-tmux-runner',
    cmd = 'VtrOpenRunner',
    dependencies = {
      'Traap/vim-bundle-tmux-runner'
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Set colors

  { 'ChristianChiarulli/nvim-ts-rainbow', event = 'VeryLazy' },
  { 'mechatroner/rainbow_csv',            event = 'VimEnter' },
  { 'norcalli/nvim-colorizer.lua',        event = 'VimEnter' },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Set colorscheme

  { 'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,

    dependencies = {
      { 'xiyaowong/nvim-transparent',

        event = 'VimEnter',

        config = function()
          vim.cmd([[TransparentEnable]])
        end,

        opts = function ()
          return {
            {
              enable = true,
              extra_gropus = {
                'Comment',
                'CursorLine',
                'CursorLineNr',
                'CursorLineSign',
                'Folded',
                'LineNr',
                'Normal',
                'SignColumn',
              },
              exclude = {
                'ColorColumn',
                'EndOfBuffer',
                'NonText',
              },
            }
          }
        end,
      },
    }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Utility

  { 'ThePrimeagen/harpoon',               event = 'BufEnter' },
  { 'dkarter/bullets.vim',                event = 'InsertEnter' },
  { 'ekickx/clipboard-image.nvim',        event = 'InsertEnter' },
  { 'goolord/alpha-nvim',                 event = 'BufEnter', enable = false },
  { 'iamcco/markdown-preview.nvim',       ft    = 'md' },
  { 'kovetskiy/sxhkd-vim',                event = 'VeryLazy' },
  { 'moll/vim-bbye',                      event = 'VeryLazy' },

  { 'rcarriga/nvim-notify', event = 'BufEnter',
    opts = function()
      return {
        {background_colour = '#000000'}
      }
    end,
  },

  { 'sbdchd/neoformat',                   event = 'VeryLazy' },
  { 'triglav/vim-visual-increment',       event = 'VeryLazy' },
  { 'vim-utils/vim-most-minimal-folds',   event = 'BufEnter' },
  { 'windwp/nvim-autopairs',              event = 'InsertEnter', config = true },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ VimTex

  { 'lervag/vimtex', event = 'BufEnter',
     dependencies = { 'Traap/vim-bundle-vimtex'},
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Wiki.Vim

  { 'lervag/wiki.vim',
    cmd = 'WikiIndex',
    dependencies = {
      'lervag/wiki-ft.vim',
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
