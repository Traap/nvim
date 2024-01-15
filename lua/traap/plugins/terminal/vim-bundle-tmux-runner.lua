require("traap.core.globals")

return {
  "Traap/vim-bundle-tmux-runner",
  enabled = false and In_Tmux(),
  event = "VeryLazy",
  dependencies = {
    "christoomey/vim-tmux-runner",
  },
}
