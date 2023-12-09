require("config.traap.globals")

local plugin = "nvim-treesitter-context"

return {
  "nvim-treesitter/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "nvim-treesitter/nvim-treesitter",
  },
}
