local platform = require("traap.core.platform")
return {
  "christoomey/vim-tmux-navigator",
  enabled = true and platform.is_nvim(),

  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>"},
  },
}
