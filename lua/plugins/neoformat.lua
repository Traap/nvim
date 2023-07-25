require("config.traap.globals")

local plugin = "neoformat"

return {
  "sbdchd/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
