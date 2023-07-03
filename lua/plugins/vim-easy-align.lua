require("config.globals")

local plugin = "vim-easy-align"

return {
  "junegunn/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
