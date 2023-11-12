require("traap.core.globals")

local plugin = "clipboard-image.nvim"

return {
  "ekickx/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
