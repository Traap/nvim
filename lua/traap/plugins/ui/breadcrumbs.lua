return {
  "LunarVim/breadcrumbs.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  config = function()
    require("breadcrumbs").setup()
  end,
  dependencies = {
   "SmiteshP/nvim-navic"
  },
}
