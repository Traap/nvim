Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "vim-projectionist"

return {
  "tpope/" .. plugin,
  ft = { "c", "cpp", "rb" },
  enabled = Is_Enabled(plugin),
}
