require("traap.core.globals")

local plugin = "rainbow_csv"

return {
  "mechatroner/" .. plugin,
  ft = { "csv", "tsv" },
  enabled = Is_Enabled(plugin),
}
