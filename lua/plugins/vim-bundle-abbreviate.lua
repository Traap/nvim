require("config.traap.globals")

local plugin = "vim-bundle-abbreviate"

return {
  "Traap/" .. plugin,
  event = "InsertEnter",
  enabled = Is_Enabled(plugin),
}
