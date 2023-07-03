Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "vim-fugitive"

return {
  "tpope/" .. plugin,
  lazy = false,
  enabled = Is_Enabled(plugin),
}
