Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-unimpaired"

return {
  "tpope/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
