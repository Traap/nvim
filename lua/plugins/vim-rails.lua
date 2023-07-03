require("config.globals")

local plugin = "vim-rails"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb" },
  enabled = Is_Enabled(plugin),
}
