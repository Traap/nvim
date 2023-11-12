require("traap.core.globals")

local plugin = "dressing.nvim"

return {
  "stevearc/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  config = true,
}
