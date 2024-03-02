return {
  "LunarVim/breadcrumbs.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = false,
  config = function()
    require("breadcrumbs").setup()
  end,
  dependencies = {
   "SmiteshP/nvim-navic"
  },
}
