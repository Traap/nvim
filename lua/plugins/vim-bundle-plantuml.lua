Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "vim-bundle-plantuml"

return {
  "Traap/" .. plugin,
  ft = "puml",
  enabled = Is_Enabled(plugin),
  dependencies = { "aklt/plantuml-syntax" },
}
