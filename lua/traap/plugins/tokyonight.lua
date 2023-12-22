return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
    opts.transparent = true
    opts.style = "night"
    opts.styles = { sidebars = "transparent", floats = "transparent", }
  end,

  config = function(_, opts)
    require("tokyonight").setup(opts)
  end,
}
