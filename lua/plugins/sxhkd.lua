Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "sxhkd-vim"

return {
  "kovetskiy/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
