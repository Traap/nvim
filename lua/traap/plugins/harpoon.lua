local platform = require("traap.core.platform")
return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",
  enabled = true and platform.is_nvim(),

  event = require("traap.config.events").file,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = {
    settings = {
      enter_on_sendcmd = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      save_on_change = true,
      save_on_toggle = false,
      sync_on_ui_close = false,
      tmux_autoclose_windows = false,
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
