Is_Enabled = require("config.functions").is_enabled

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
    enabled = Is_Enabled("vim-tmux-runner"),
    event = "VeryLazy",
    dependencies = {
      "Traap/vim-bundle-tmux-runner",
    },
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
