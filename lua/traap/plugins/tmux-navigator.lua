local platform = require("traap.core.platform")
return {
  "christoomey/vim-tmux-navigator",
  enabled = true and platform.is_nvim(),
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_disable_when_zoomed = 1
    vim.g.tmux_navigator_preserve_zoom = 1
  end,
}
