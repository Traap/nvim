require("config.traap.globals")

local plugin = "vim-bundle-fzf"

return {
  "Traap/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
