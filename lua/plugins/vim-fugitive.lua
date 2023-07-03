require("config.globals")

local plugin = "vim-fugitive"

return {
  "tpope/" .. plugin,
  lazy = false,
  enabled = Is_Enabled(plugin),
}
