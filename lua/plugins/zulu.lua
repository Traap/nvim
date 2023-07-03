-- Zulu should be the last plugin loaded by lazy.
require("config.globals")

local plugin = "vim-bundle-abbreviate"

return {
  "Traap/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
