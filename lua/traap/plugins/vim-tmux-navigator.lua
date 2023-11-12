require("traap.core.globals")

local plugin = "vim-tmux-navigator"

return {
  "christoomey/" .. plugin,
  enabled = Is_Enabled(plugin),
  event =  "VeryLazy",
  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Window Left"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Window Down"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Window Up"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Window Right"},
  },
}
