return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enable = true,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = {
      enabled = true,
      animate = {
        step = 10,
        total = 150,
      },
      indent = {
        only_scope = false,
        only_current = false,
      }
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      style = "compact",
      top_down = false,
      title_pos = "left"
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
