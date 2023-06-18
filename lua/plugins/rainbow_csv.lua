Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "rainbow_csv"

return {
  "mechatroner/" .. plugin,
  ft = { "csv", "tsv" },
  enabled = Is_Enabled(plugin),
}
