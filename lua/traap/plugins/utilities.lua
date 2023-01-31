return {
  -- {{{ General startup

  { 'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  { 'nvim-lua/plenary.nvim', lazy = false},
  { 'nvim-lua/popup.nvim', event = 'VimEnter' },

  { 'folke/trouble.nvim', event = 'VimEnter',
     opts = {use_diagnostic_signs = true }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ better vim.ui

  { 'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Indent guides for Neovim

 {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    opts = {
      char = '│',
      filetype_exclude = {
        'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy'
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
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

  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', config = true },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ PlantUM

  { 'aklt/plantuml-syntax',
    keys = '<leader>gu',
    dependencies = 'Traap/vim-bundle-plantuml',
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neovim without Tpope?  No Way!!!

  { 'tpope/gem-browse',        ft = {'rb'} },
  { 'tpope/vim-bundler',       ft = {'rb'} },
  { 'tpope/vim-commentary',    event = 'VeryLazy'},
  -- { 'tpope/vim-dispatch',      event = 'VeryLazy' },
  { 'tpope/vim-endwise',       event = 'InsertEnter' },
  { 'tpope/vim-eunuch',        event = 'VeryLazy' },
  { 'tpope/vim-fugitive',      lazy = false, priority = 999},
  { 'tpope/vim-projectionist', ft = {'c', 'cpp', 'rb' } },
  { 'tpope/vim-rails',         ft = 'rb' },
  { 'tpope/vim-rake',          ft = 'rb' },
  { 'tpope/vim-rbenv',         ft = 'rb' },
  { 'tpope/vim-repeat',        event = 'InsertEnter' },
--  { 'tpope/vim-surround',      event = 'InsertEnter' },
  { 'tpope/vim-unimpaired',    event = 'VeryLazy' },

  { 'kylechui/nvim-surround', event = 'InsertEnter', config = true },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Navigate Vim Splits and Tmux pains.

  { 'christoomey/vim-tmux-navigator', event = 'BufEnter '},

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Noice - (Nice, Noise, Notice)

  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',

  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --       }
  --     },
  --   },

  --   presets = {
  --     bottom_search = true,
  --     command_palette = true,
  --     long_message_to_split = true,
  --   },

  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --   },
  -- },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-tree

  {
    'kyazdani42/nvim-tree.lua',

    cmd = {
      'NvimTreeFindFile',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },

    opts = {
      filters = {
        custom = { '.git' },
      },
      view = {
        side = 'right',
        width = 30,
      },
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ nvim-tree nvim-web-devicons

  {
    'nvim-tree/nvim-web-devicons',

    cmd = {
      'NvimTreeFindFile',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },

    opts = {
      override = {
        Dockerfile = {icon = '',  color = '#b8b5ff', name = 'Dockerfile'},
        css        = {icon = '',  color = '#61afef', name = 'css'},
        deb        = {icon = '',  color = '#a3b8ef', name = 'deb'},
        html       = {icon = '',  color = '#DE8C92', name = 'html'},
        jpeg       = {icon = ' ', color = '#BD77DC', name = 'jpeg'},
        jpg        = {icon = ' ', color = '#BD77DC', name = 'jpg'},
        js         = {icon = '',  color = '#EBCB8B', name = 'js'},
        kt         = {icon = '󱈙',  color = '#ffcb91', name = 'kt'},
        lock       = {icon = '',  color = '#DE6B74', name = 'lock'},
        md         = {icon = '',  color = '#b8b5ff', name = 'mp3'},
        mp3        = {icon = '',  color = '#C8CCD4', name = 'mp3'},
        mp4        = {icon = '',  color = '#C8CCD4', name = 'mp4'},
        out        = {icon = '',  color = '#C8CCD4', name = 'out'},
        png        = {icon = ' ', color = '#BD77DC', name = 'png'},
        py         = {icon = '',  color = '#a7c5eb', name = 'py'},
        rb         = {icon = '',  color = '#ff75a0', name = 'rb'},
        rpm        = {icon = '',  color = '#fca2aa', name = 'rpm'},
        toml       = {icon = '',  color = '#61afef', name = 'toml'},
        ts         = {icon = 'ﯤ',  color = '#519ABA', name = 'ts'},
        vue        = {icon = '﵂',  color = '#7eca9c', name = 'vue'},
        xz         = {icon = '',  color = '#EBCB8B', name = 'xz'},
        yaml       = {icon = '',  color = '#EBCB8B', name = 'xz'},
        zip        = {icon = '',  color = '#EBCB8B', name = 'zip'}
      },
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ Telescope

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = {
      defaults = {
        layout_config = { prompt_position = 'top' },
        layout_strategy = 'horizontal',
        prompt_prefix = ' ',
        selection_caret = ' ',
        sorting_strategy = 'ascending',
        winblend = 0,
      },
      pickers = {
        colorscheme = { enable_preview = true, }
      },
    },
  },

  -- Telescope fzf native
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('fzf')
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Tmux

  { 'christoomey/vim-tmux-runner',
    cmd = 'VtrOpenRunner',
    dependencies = {
      'Traap/vim-bundle-tmux-runner'
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Treesitter

  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = 'BufReadPost',
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
      },
      disable = {'latex'},
      ensure_installed = require('traap.core.constants').treesitter_languages
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Set colors

  { 'ChristianChiarulli/nvim-ts-rainbow', event = 'VimEnter' },
  { 'mechatroner/rainbow_csv',            ft =  {'csv', 'tsv' } },
  { 'norcalli/nvim-colorizer.lua',        event = 'vimEnter', config = true },

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
  -- {{{ Search & replace in multiple files.

  {
    'windwp/nvim-spectre',
    keys = {
      { '<leader>sr',
        function()
          require('spectre').open()
        end, desc = 'Replace in files (Spectre)'
      },
    },
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
    opts = {
      background_colour = '#1b1b26',
      timeout = 10000,
    }
  },

  { 'sbdchd/neoformat',                   event = 'VeryLazy' },
  { 'triglav/vim-visual-increment',       event = 'VeryLazy' },
  { 'vim-utils/vim-most-minimal-folds',   event = 'BufEnter' },
  { 'windwp/nvim-autopairs',              event = 'InsertEnter', config = true },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ VimTex

  { 'lervag/vimtex',
     ft={'tex', 'texx'},
     dependencies = { 'Traap/vim-bundle-vimtex'},
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Wiki.Vim

  { 'lervag/wiki.vim',
    cmd = {'WikiIndex', 'WikiJournal'},
    ft = {'wiki'},
    dependencies = {
      'lervag/wiki-ft.vim',
      'Traap/vim-bundle-wiki.vim',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Which-key

  {'folke/which-key.nvim',
    enable = false,
    event = 'VimEnter',
    config = true
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git signs and lightbulb.

  { 'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '契' },
      topdelete = { text = '契' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },

    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map('n', ']h', gs.next_hunk, 'Next Hunk')
      map('n', '[h', gs.prev_hunk, 'Prev Hunk')
      map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
      map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
      map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
      map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
      map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
      map('n', '<leader>ghp', gs.preview_hunk, 'Preview Hunk')
      map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
      map('n', '<leader>ghd', gs.diffthis, 'Diff This')
      map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
    end,
  },
},

  { 'kosayoda/nvim-lightbulb',
    event = 'BufReadPre',
    opts = { autocmd = {enabled = true } },
    dependencies = { 'antoinemadec/FixCursorHold.nvim', }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Zulu : Reuse Traap's vim bundles last.

  { 'Traap/vim-bundle-abbreviate', event = 'BufEnter' },

  -- ----------------------------------------------------------------------- }}}
}
