Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "sxhkd-vim"

return {
  "kovetskiy/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
