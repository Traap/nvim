require("config.traap.globals")

local plugin = "vim-rake"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb", "BufEnter Rakefile" },
  enabled = Is_Enabled(plugin),
}
