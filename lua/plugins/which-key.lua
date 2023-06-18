Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "which-key.nvim"
return {
  "folke/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  keys = false,
}
