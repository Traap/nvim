Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "nvim-colorizer.lua"

return {
  "NvChad/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
