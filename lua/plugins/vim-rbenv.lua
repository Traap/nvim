Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-rbenv"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb" },
  enabled = Is_Enabled(plugin),
}
