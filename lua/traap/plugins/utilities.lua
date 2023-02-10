return {
  -- {{{ General startup

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    enabled = function()
      return require('traap.core.customize').vim_startuptime
    end,
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    enabled = function()
      return require('traap.core.customize').plenary_nvim
    end,
  },

  {
    'nvim-lua/popup.nvim',
    event = 'VimEnter',
    enabled = function()
      return require('traap.core.customize').popup_nvim
    end,
  },


  {
    'folke/trouble.nvim',
    event = 'VimEnter',
    enabled = function()
      return require('traap.core.customize').trouble_nvim
    end,
    opts = {use_diagnostic_signs = true }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ better vim.ui

  {
    'stevearc/dressing.nvim',
    enabled = function()
      return require('traap.core.customize').dressing
    end,
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
    enabled = function()
      return require('traap.core.customize').indent_blankline
    end,
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

  {
    'junegunn/vim-easy-align',
    enabled = function()
      return require('traap.core.customize').vim_easy_align
    end,
    event = 'BufEnter',
  },

  {
    'junegunn/fzf',
    enabled = function()
      return require('traap.core.customize').fzf
    end,
    event = 'BufEnter',
    dependencies = {
      'junegunn/fzf.vim',
      'Traap/vim-bundle-fzf',
    }
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Lualine

  {
    'nvim-lualine/lualine.nvim',
    enabled = function()
      return require('traap.core.customize').nvim_lualine
    end,
    event = 'VeryLazy',
    config = true
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ PlantUML

  {
    'Traap/vim-bundle-plantuml',
    ft='puml',
    enabled = function()
      return require('traap.core.customize').vim_bundle_plantuml
    end,
    dependencies = {
      'aklt/plantuml-syntax',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Neovim without Tpope?  No Way!!!

  {
    'tpope/gem-browse',
    ft = {'rb'},
    enabled = function()
      return require('traap.core.customize').gem_browse
    end,
  },

  {
    'tpope/vim-bundler',
    ft = {'rb'},
    enabled = function()
      return require('traap.core.customize').vim_bundler
    end,
  },

  {
    'tpope/vim-commentary',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').vim_commentary
    end,
  },

  {
    'tpope/vim-endwise',
    event = 'InsertEnter',
    enabled = function()
      return require('traap.core.customize').vim_endwise
    end,
  },

  {
    'tpope/vim-eunuch',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').vim_eunuch
    end,
  },

  {
    'tpope/vim-fugitive',
    lazy = false,
    priority = 999,
    enabled = function()
      return require('traap.core.customize').vim_fugitive
    end,
  },

  {
    'tpope/vim-projectionist',
    ft = {'c', 'cpp', 'rb' },
    enabled = function()
      return require('traap.core.customize').vim_projectionist
    end,
  },

  {
    'tpope/vim-rails',
    ft = 'rb',
    enabled = function()
      return require('traap.core.customize').vim_rails
    end,
  },

  {
    'tpope/vim-rake',
    ft = 'rb',
    enabled = function()
      return require('traap.core.customize').vim_rake
    end,
  },

  {
    'tpope/vim-rbenv',
    ft = 'rb',
    enabled = function()
      return require('traap.core.customize').vim_rbenv
    end,
  },

  {
    'tpope/vim-repeat',
    event = 'InsertEnter',
    enabled = function()
      return require('traap.core.customize').vim_bundler
    end,
  },

  {
    'tpope/vim-surround',
    event = 'InsertEnter',
    enabled = function()
      return require('traap.core.customize').vim_surround
    end,
  },

  {
    'tpope/vim-unimpaired',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').vim_unimpaired
    end,
  },

  {
    'kylechui/nvim-surround',
    event = 'InsertEnter',
    config = true,
    enabled = function()
      return require('traap.core.customize').nvim_surround
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Navigate Vim Splits and Tmux pains.

  {
    'christoomey/vim-tmux-navigator',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').vim_tmux_navigator
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Noice - (Nice, Noise, Notice)

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').noice_nvim
    end,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        }
      },
    },

    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },

    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-tree

  {
    'kyazdani42/nvim-tree.lua',
    enabled = function()
      return require('traap.core.customize').nvim_tree
    end,

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
    enabled = function()
      return require('traap.core.customize').nvim_web_devicons
    end,

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
    enabled = function()
      return require('traap.core.customize').telescope
    end,
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

  {
    'christoomey/vim-tmux-runner',
    enabled = function()
      return require('traap.core.customize').vim_tmux_runner
    end,

    cmd = 'VtrOpenRunner',
    dependencies = {
      'Traap/vim-bundle-tmux-runner'
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Treesitter

  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    enabled = function()
      return require('traap.core.customize').nvim_treesitter
    end,

    version = false,
    build = ':TSUpdate',
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

    dependencies = {
      'mrjones2014/nvim-ts-rainbow',
      enabled = function()
        return require('traap.core.customize').nvim_ts_rainbow
      end,
    },

  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Set colors

  {
    'mrjones2014/nvim-ts-rainbow',
    event = 'VimEnter',
    enabled = function()
      return require('traap.core.customize').nvim_ts_rainbow
    end,
  },

  {
    'mechatroner/rainbow_csv',
    ft =  {'csv', 'tsv' },
    enabled = function()
      return require('traap.core.customize').rainbow_csv
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = true,
    enabled = function()
      return require('traap.core.customize').nvim_colorizer_lua
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Set colorscheme

  { 'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,

    enabled = function()
      return require('traap.core.customize').nvim_base16
    end,

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
    enabled = function()
      return require('traap.core.customize').nvim_spectre
    end,
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

  {
    'ThePrimeagen/harpoon',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').harpoon
    end,
  },

  {
    'dkarter/bullets.vim',
    lazy  = false,
    enabled = function()
      return require('traap.core.customize').bullets_vim
    end,
  },

  {
    'ekickx/clipboard-image.nvim',
    event = 'InsertEnter',
    enabled = function()
      return require('traap.core.customize').clipboard_image_nvim
    end,
  },

  {
    'goolord/alpha-nvim',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').alpha_nvim
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'md',
    enabled = function()
      return require('traap.core.customize').markdown_preview_nvim
    end,
  },

  {
    'kovetskiy/sxhkd-vim',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').sxhkd_vim
    end,
  },

  {
    'moll/vim-bbye',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').vim_bbye
    end,
  },

  {
    'rcarriga/nvim-notify',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').nvim_notify
    end,
    opts = {
      background_colour = '#1a1b26',
      timeout = 1000,
    }
  },

  {
    'sbdchd/neoformat',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').neoformat
    end,
  },

  {
    'triglav/vim-visual-increment',
    event = 'VeryLazy',
    enabled = function()
      return require('traap.core.customize').vim_visual_increment
    end,
  },

  {
    'vim-utils/vim-most-minimal-folds',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').vim_most_minimal_folds
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    enabled = function()
      return require('traap.core.customize').nvim_autopairs
    end,
    config = true,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ VimTex

  {
    'lervag/vimtex',
     ft={'tex', 'texx'},
    enabled = function()
      return require('traap.core.customize').vimtex
    end,
    dependencies = { 'Traap/vim-bundle-vimtex'},
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Wiki.Vim

  { 'lervag/wiki.vim',
    cmd = {'WikiIndex', 'WikiJournal'},
    ft = {'wiki', 'md', 'puml'},
    enabled = function()
      return require('traap.core.customize').wiki_vim
    end,
    dependencies = {
      'lervag/wiki-ft.vim',
      'Traap/vim-bundle-wiki.vim',
      'Traap/vim-bundle-plantuml',
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Which-key

  {
   'folke/which-key.nvim',
    enabled = function()
      return require('traap.core.customize').which_key_nvim
    end,
    event = 'VimEnter',
    config = true
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git signs and lightbulb.

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    enabled = function()
      return require('traap.core.customize').gitsigns_nvim
    end,

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

  {
    'Traap/vim-bundle-abbreviate',
    event = 'BufEnter',
    enabled = function()
      return require('traap.core.customize').vim_bundle_abbreviate
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
