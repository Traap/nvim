require("config.traap.globals")

local plugin = "vim-bundler"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb" },
  enabled = Is_Enabled(plugin),
}
