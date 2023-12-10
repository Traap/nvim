require("config.traap.globals")

local plugin = "cmp_luasnip"

return {

  "saadparwaiz1/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "hrsh7th/nvim-cmp",
  },
}
