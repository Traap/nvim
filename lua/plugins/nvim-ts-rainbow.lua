Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "nvim-ts-rainbow"

return {
  "mrjones2014/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
