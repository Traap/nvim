require("config.traap.globals")

local plugin = "which-key.nvim"
return {
  "folke/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  keys = false,
}
