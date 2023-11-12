require("traap.core.globals")

local plugin = "vim-rbenv"

return {
  "tpope/" .. plugin,
  event = { "BufEnter *.rb" },
  enabled = Is_Enabled(plugin),
}
