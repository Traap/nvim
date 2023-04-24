Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  -- {{{ nvim-base16

  {
    "RRethy/nvim-base16",
    enabled = Is_Enabled("nvim-base16"),
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ tokyonight.nvim

  {
    "folke/tokyonight.nvim",
    enabled = Is_Enabled("tokyonight.nvim"),
    lazy = false,
    opts = function(_, opts)
      if Use_Defaults("tokyonight.nvim") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts.style = "night"
        opts.styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-colorizer

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("nvim-colorizer.lua"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-transpartent

  {
    "xiyaowong/nvim-transparent",
    enabled = Is_Enabled("nvim-transparent"),
    lazy = true,
    event = "VimEnter",
    opts = {
      enable = true,
      "Comment",
      extra_gropus = {
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
    config = function()
      vim.cmd([[TransparentEnable]])
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = Is_Enabled("nvim-treesitter"),
    opts = function(_, opts)
      if Use_Defaults("nvim-treesitter") then
        -- Use LazyVim default setup.
        opts = opts
      else
        -- Use my customizations.
        opts.autopairs = { enable = true }
        opts.autotag = { enable = true, disable = { "xml" } }
        opts.context_commenting = { enable = true, enable_autocmd = false }
        opts.highlight = {
          enable = true,
          disable = Constants.disabled.treesitter,
          additional_vim_regex_highlighting = true,
        }
        opts.indent = { enable = true, disable = { "yml", "yaml" } }
        opts.rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1500,
          colors = Constants.colors.rainbow,
        }
        opts.disable = { "latex" }
        opts.ensure_installed = Constants.ensure_installed.treesitter
      end
    end,

    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-ts-rainbow

  {
    "mrjones2014/nvim-ts-rainbow",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("nvim-ts-rainbow"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ rainbow_csv

  {
    "mechatroner/rainbow_csv",
    ft = { "csv", "tsv" },
    enabled = Is_Enabled("rainbow_csv"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ sxhkd-vim

  {
    "kovetskiy/sxhkd-vim",
    event = "VeryLazy",
    enabled = Is_Enabled("sxhkd-vim"),
  },

  -- ----------------------------------------------------------------------- }}}
}
