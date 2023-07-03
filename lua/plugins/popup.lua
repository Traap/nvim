require("config.globals")

local plugin = "popup.nvim"

return {
  "nvim-lua/" .. plugin,
  event = "VimEnter",
  enabled = Is_Enabled(plugin),
}
