Is_Enabled = require("config.functions").is_enabled

local plugin = "vimtex"

return {
  "lervag/" .. plugin,
  ft = {"tex", "texx"},
  enabled = Is_Enabled(plugin),
	dependencies = { "Traap/vim-bundle-vimtex" },
}
