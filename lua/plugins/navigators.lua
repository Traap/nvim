Is_Enabled = require("config.functions").is_enabled
In_Tmux = require("config.functions").in_tmux

return {
  -- {{{ vim-tmux-navigator

  {
    "christoomey/vim-tmux-navigator",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-tmux-navigator"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-tmux-runner

  {
    "christoomey/vim-tmux-runner",
    enabled = Is_Enabled("vim-tmux-runner") and In_Tmux(),
    event = "VeryLazy",
    dependencies = {
      "Traap/vim-bundle-tmux-runner",
    },
  },

  {
    "Traap/vim-bundle-tmux-runner",
    enabled = Is_Enabled("vim-bundle-tmux-runner") and In_Tmux(),
    event = "VeryLazy",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ harpoon

  {
    "ThePrimeagen/harpoon",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("harpoon"),
    config = true,
  },

  -- ----------------------------------------------------------------------- }}}
}
