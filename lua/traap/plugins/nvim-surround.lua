require("traap.core.globals")

local plugin = "nvim-surround"

return {
  "kylechui/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  config = true,
}
