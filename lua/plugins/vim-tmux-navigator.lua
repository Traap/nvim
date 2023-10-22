require("config.traap.globals")

local plugin = "vim-tmux-navigator"

return {
  "christoomey/" .. plugin,
  enabled = Is_Enabled(plugin),
  event =  "VeryLazy",
}
