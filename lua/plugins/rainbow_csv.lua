Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "rainbow_csv"

return {
  "mechatroner/" .. plugin,
  ft = { "csv", "tsv" },
  enabled = Is_Enabled(plugin),
}
