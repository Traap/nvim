Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "clipboard-image.nvim"

return {
  "ekickx/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
