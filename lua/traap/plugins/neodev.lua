require("traap.core.globals")

local plugin = "neodev.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    opts = {}
  end,
}
