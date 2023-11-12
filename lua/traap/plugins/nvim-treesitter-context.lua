require("traap.core.globals")

local plugin = "nvim-treesitter-context"

return {
  "nvim-treesitter/" .. plugin,
  enabled = Is_Enabled(plugin),
}
