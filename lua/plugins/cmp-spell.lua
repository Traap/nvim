require("config.traap.globals")

local plugin = "cmp-spell"

return {
  "f3fora/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "hrsh7th/nvim-cmp",
  },
}
