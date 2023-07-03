require("config.globals")

local plugin = "vim-bundle-tmux-runner"

return {
  "Traap/" .. plugin,
  enabled = Is_Enabled(plugin) and In_Tmux(),
  event = "VeryLazy",
  dependencies = {
    "christoomey/vim-tmux-runner",
  },
}
