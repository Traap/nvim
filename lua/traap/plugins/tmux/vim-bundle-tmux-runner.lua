require("traap.core.globals")

return {
  "Traap/vim-bundle-tmux-runner",
  enabled = In_Tmux(),
  event = "VeryLazy",
  dependencies = {
    "christoomey/vim-tmux-runner",
  },
}
