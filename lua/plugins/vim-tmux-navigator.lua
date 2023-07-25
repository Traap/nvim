require("config.traap.globals")

local plugin = "vim-tmux-navigator"

return {
  "christoomey/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled("vim-tmux-navigator"),
}
