require("traap.core.globals")

local plugin = "none-ls.nvim"

return {
  "nvimtools/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  config = true,
}
