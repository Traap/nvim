local platform = require("traap.core.platform")
return {
  -- {{{ Define the Harpoon lazy.nvim specification.

  "ThePrimeagen/harpoon",
  enabled = true and platform.is_nvim(),

  event = require("traap.config.events").file,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  -- Harpoon writes the list on VimLeavePre. save_on_change, mark_branch,
  -- enter_on_sendcmd, excluded_filetypes, and tmux_autoclose_windows are gone.
  opts = {
    settings = {
      save_on_toggle = false,
      sync_on_ui_close = false,
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
