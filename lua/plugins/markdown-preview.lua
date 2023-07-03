Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "markdown-preview.nvim"

return {
  "iamcco/" .. plugin ,
  ft = "md",
  enabled = Is_Enabled(plugin),
}
