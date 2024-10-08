return {
  "rose-pine/neovim",
  enabled = false,
  lazy = false,
  priority = 1000,

  opts = function(_, opts)
    opts.name = "rose-pine"
  end,

  config = function(_, opts)
    require("rose-pine").setup(opts)
  end,
}
