return {
  "Traap/vim-tmux-navigator",
  enabled = false,
  event =  "VeryLazy",

  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Window Left"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Window Down"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Window Up"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Window Right"},
  },
}
