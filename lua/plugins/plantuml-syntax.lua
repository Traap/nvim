require("config.traap.globals")

local plugin = "plantuml-syntax"

return {
  "aklt/" .. plugin,
  event = "VeryLazy",
  ft = {"puml", "wsd"},
  enabled = Is_Enabled(plugin),
}
