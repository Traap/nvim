require("traap.core.globals")

local plugin = "bullets.vim"

return {
  "dkarter/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
