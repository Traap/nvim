Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-rake"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb", "BufEnter Rakefile" },
  enabled = Is_Enabled(plugin),
}
