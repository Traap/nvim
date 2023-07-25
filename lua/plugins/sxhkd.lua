require("config.traap.globals")

local plugin = "sxhkd-vim"

return {
  "kovetskiy/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
