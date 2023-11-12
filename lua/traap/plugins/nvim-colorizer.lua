require("traap.core.globals")

local plugin = "nvim-colorizer.lua"

-- Colorizer is enabled and or config through settings in Customize.lua
-- Red green and blue are colorized when plugin is enabled and config true.
-- Red  = #FF0000
-- Green = #00FF00
-- Blue = #0000FF
--
return {
  "NvChad/" .. plugin,
  event = { "BufReadPre", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  config = Use_Default_Config(plugin)
}
