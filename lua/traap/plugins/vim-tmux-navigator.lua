return {
  "christoomey/vim-tmux-navigator",
  enabled = true,
  event =  "VeryLazy",

  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Window Left"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Window Down"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Window Up"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Window Right"},
  },
}
