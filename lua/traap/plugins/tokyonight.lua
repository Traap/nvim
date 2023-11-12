require("traap.core.globals")

local plugin = "tokyonight.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
    opts.style = "night"
    opts.styles = { sidebars = "transparent", floats = "transparent", }
  end,
}
