Is_Enabled = require("config.functions").is_enabled

-- {{{ neoformat

local plugin = "neoformat"

return {
  "sbdchd/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}

-- ------------------------------------------------------------------------- }}}
