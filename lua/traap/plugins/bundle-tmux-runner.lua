return {
  "Traap/vim-bundle-tmux-runner",
  enabled = true and os.getenv('TMUX') ~= nil,
  event = "VeryLazy",
  dependencies = {
    "Traap/vim-tmux-runner",
  },
}
