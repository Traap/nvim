Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "vim-rake"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb", "BufEnter Rakefile" },
  enabled = Is_Enabled(plugin),
}
