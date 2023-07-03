require("config.globals")

local plugin = "nvim-ts-rainbow"

return {
  "mrjones2014/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
