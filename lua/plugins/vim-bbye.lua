require("config.globals")

local plugin = "vim-bbye"

return {
  "moll/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
