Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "popup.nvim"

return {
  "nvim-lua/" .. plugin,
  event = "VimEnter",
  enabled = Is_Enabled(plugin),
}
