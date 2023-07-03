require("config.globals")

local plugin = "vim-bundle-plantuml"

return {
  "Traap/" .. plugin,
  ft = "puml",
  enabled = Is_Enabled(plugin),
  dependencies = { "aklt/plantuml-syntax" },
}
