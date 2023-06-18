Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "bullets.vim"

return {
  "dkarter/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
