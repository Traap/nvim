require("config.traap.globals")

local plugin = "vim-projectionist"

return {
  "tpope/" .. plugin,
  ft = { "c", "cpp", "rb" },
  enabled = Is_Enabled(plugin),
}
