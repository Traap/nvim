Customize = require("config.customize")
Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ Indent guides for Neovim

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("indent-blankline"),
    opts = function(_, opts)
      if Use_Defaults("indent-blankline") then
        -- Use LazyVim default setup.
        opts = {}
      else
        -- Use my customizations.
        opts.char = "│"
        opts.filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
        }
        opts.show_trailing_blankline_indent = false
        opts.show_current_context = false
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ markdown-perview.nvim

  {
    "iamcco/markdown-preview.nvim",
    ft = "md",
    enabled = Is_Enabled("markdown-preview.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-notify

  {
    "rcarriga/nvim-notify",
    enabled = Is_Enabled("nvim-notify"),
    opts = function(_, opts)
      if Use_Defaults("nvim-notify") then
        -- Use LazyVim default setup.
        opts = opts
      else
        opts.background_colour = "#1a1b26"
        opts.timeout = 1500
        opts.top_down = false
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Popup.nvim

  {
    "nvim-lua/popup.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("popup.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-most-minimal-folds

  {
    "vim-utils/vim-most-minimal-folds",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-most-minimal-folds"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtcolumn.nvim

  {
    "xiyaowong/virtcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("virtcolumn.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Which-key

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("which-key.nvim"),
    keys = false,
  },

  -- ----------------------------------------------------------------------- }}}
}
