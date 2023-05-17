Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-easy-align"

return {
  "junegunn/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
