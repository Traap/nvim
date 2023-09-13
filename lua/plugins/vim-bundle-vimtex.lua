require("config.traap.globals")

local plugin = "vim-bundle-vimtex"

return {
  "Traap/" .. plugin,
  ft = {"tex", "texx"},
  enabled = Is_Enabled(plugin),
}
