require("config.traap.globals")

local plugin = "vim-bundle-fzf"

return {
  "Traap/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
