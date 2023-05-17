Is_Enabled = require("config.functions").is_enabled

-- {{{ nvim-surround

local plugin = "nvim-surround"

return {
  "kylechui/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  config = true,
}

-- ------------------------------------------------------------------------- }}}
