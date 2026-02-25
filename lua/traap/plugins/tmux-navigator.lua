return {
  "christoomey/vim-tmux-navigator",
  enabled = true and (not vim.g.vscode),

  keys = {
    {"<c-h>", "<cmd>TmuxNavigateLeft<cr>"},
    {"<c-j>", "<cmd>TmuxNavigateDown<cr>"},
    {"<c-k>", "<cmd>TmuxNavigateUp<cr>"},
    {"<c-l>", "<cmd>TmuxNavigateRight<cr>"},
  },
}
