-- Also listed in plugins/init.lua. lazy.nvim merges the two specs.
-- config = true uses the defaults, which colorize hex values such as #FF0000.
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
