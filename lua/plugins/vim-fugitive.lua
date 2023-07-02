Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-fugitive"

return {
  "tpope/" .. plugin,
  lazy = false,
  enabled = Is_Enabled(plugin),
}
