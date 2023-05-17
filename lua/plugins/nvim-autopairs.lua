Is_Enabled = require("config.functions").is_enabled

-- {{{ neoformat

local plugin = "nvim-autopairs"

return {
  "windwp/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  config = true,
}

-- ------------------------------------------------------------------------- }}}
