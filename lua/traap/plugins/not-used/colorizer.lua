-- Colorizer is enabled and or config through settings in Customize.lua
-- Red green and blue are colorized when plugin is enabled and config true.
-- Red  = #FF0000
-- Green = #00FF00
-- Blue = #0000FF
--
return {
  "NvChad/nvim-colorizer.lua",
  event = require("traap.config.events").file,
  enabled = true,
  config = true,
}
