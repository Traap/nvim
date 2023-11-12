require("traap.core.globals")

local plugin = "which-key.nvim"
return {
  "folke/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  keys = false,
}
