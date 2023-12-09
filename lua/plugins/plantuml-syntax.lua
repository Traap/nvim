require("config.traap.globals")

local plugin = "plantuml-syntax"

return {
  "aklt/" .. plugin,
  event = {"BufReadPost", "BufNewFile"},
  enabled = Is_Enabled(plugin),
}
