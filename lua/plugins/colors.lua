return {
  -- {{{ base16 tokyo night terminal storm

  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,

    enabled = function()
      return require("config.customize").nvim_base16
    end,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,

    dependencies = {
      {
        "xiyaowong/nvim-transparent",

        enabled = function()
          return require("config.customize").nvim_transparent
        end,
        event = "VimEnter",

        config = function()
          vim.cmd([[TransparentEnable]])
        end,

        opts = function()
          return {
            {
              enable = true,
              extra_gropus = {
                "Comment",
                "CursorLine",
                "CursorLineNr",
                "CursorLineSign",
                "Folded",
                "LineNr",
                "Normal",
                "SignColumn",
              },
              exclude = {
                "ColorColumn",
                "EndOfBuffer",
                "NonText",
              },
            },
          }
        end,
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ tokyonight

  -- {
  --   'folke/tokyonight.nvim',
  --   enabled = function()
  --     return require('config.customize').tokyonight_nvim
  --   end,
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = 'storm',
  --     styles = {
  --       sidebars = 'transparent',
  --       floats = 'transparent',
  --     }
  --   },
  --   config = function()
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ catppuccin

  {
    "catppuccin/nvim",
    enabled = function()
      return require("config.customize").catppuccin
    end,
    lazy = true,
    name = "catppuccin",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-colorizer

  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = true,
    enabled = function()
      return require("config.customize").nvim_colorizer_lua
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    enabled = function()
      return require("config.customize").nvim_treesitter
    end,

    version = false,
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
      },
      disable = { "latex" },
      ensure_installed = require("config.constants").treesitter_languages,
    },

    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      enabled = function()
        return require("config.customize").nvim_ts_rainbow
      end,
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-ts-rainbow

  {
    "mrjones2014/nvim-ts-rainbow",
    event = "VimEnter",
    enabled = function()
      return require("config.customize").nvim_ts_rainbow
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ rainbow_csv

  {
    "mechatroner/rainbow_csv",
    ft = { "csv", "tsv" },
    enabled = function()
      return require("config.customize").rainbow_csv
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ sxhkd-vim

  {
    "kovetskiy/sxhkd-vim",
    event = "VeryLazy",
    enabled = function()
      return require("config.customize").sxhkd_vim
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
