return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enable = true,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      style = "compact",
      top_down = false,
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
