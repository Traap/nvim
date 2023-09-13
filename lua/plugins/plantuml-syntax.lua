require("config.traap.globals")

local plugin = "plantuml-syntax"

return {
  "aklt/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
