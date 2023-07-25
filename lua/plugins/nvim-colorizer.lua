require("config.traap.globals")

local plugin = "nvim-colorizer.lua"

return {
  "NvChad/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
