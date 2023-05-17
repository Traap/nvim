Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-bundle-plantuml"

return {
  "Traap/" .. plugin,
  ft = "puml",
  enabled = Is_Enabled(plugin),
  dependencies = { "aklt/plantuml-syntax" },
}
