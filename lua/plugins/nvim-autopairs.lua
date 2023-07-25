require("config.traap.globals")

local plugin = "nvim-autopairs"

return {
  "windwp/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  config = true,
}
