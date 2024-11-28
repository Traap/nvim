return {
  "LunarVim/breadcrumbs.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("breadcrumbs").setup()
  end,
  dependencies = {
   "SmiteshP/nvim-navic"
  },
}
