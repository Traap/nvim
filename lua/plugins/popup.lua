Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "popup.nvim"

return {
  "nvim-lua/" .. plugin,
  event = "VimEnter",
  enabled = Is_Enabled(plugin),
}
