Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-eunuch"

return {
  "tpope/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
