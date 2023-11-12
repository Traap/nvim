require("traap.core.globals")

local plugin = "trouble.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  config = true,
  dependencies = {"nvim-tree/nvim-web-devicons"},
}
