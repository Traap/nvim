require("config.traap.globals")

local plugin = "vim-tmux-navigator"

return {
  "christoomey/" .. plugin,
  enabled = Is_Enabled(plugin) and In_Tmux(),
  event =  "VeryLazy",
}
