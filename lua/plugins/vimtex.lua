require("config.globals")

local plugin = "vimtex"

return {
  "lervag/" .. plugin,
  ft = {"tex", "texx"},
  enabled = Is_Enabled(plugin),
	dependencies = { "Traap/vim-bundle-vimtex" },
}
