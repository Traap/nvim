require("config.traap.globals")

local plugin = "vim-endwise"

return {
  "tpope/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
