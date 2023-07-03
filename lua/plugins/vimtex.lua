Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "vimtex"

return {
  "lervag/" .. plugin,
  ft = {"tex", "texx"},
  enabled = Is_Enabled(plugin),
	dependencies = { "Traap/vim-bundle-vimtex" },
}
