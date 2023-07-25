require("config.traap.globals")

local plugin = "vim-commentary"

return {
  "tpope/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
