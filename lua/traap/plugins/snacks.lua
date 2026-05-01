-- Make Snacks global.
Snacks = Snacks
local platform = require("traap.core.platform")
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enabled = true and platform.is_nvim(),

  init = function()
    vim.o.equalalways = false
  end,

  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = { header = [[Configured by Traap and powered by lazy.nvim.]] },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    image = { enabled = (vim.uv.os_uname().sysname ~= "Windows_NT") },
    notifier = {
      enabled = true,
      timeout = 1000,
      top_down = true,
      title_pos = "left",
    },

    picker = {
      enabled = true,
      actions = platform.tmux_actions,
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ["<c-h>"] = { "tmux_left", mode = { "i", "n" } },
                ["<c-j>"] = { "tmux_down", mode = { "i", "n" } },
                ["<c-k>"] = { "tmux_up", mode = { "i", "n" } },
                ["<c-l>"] = { "tmux_right", mode = { "i", "n" } },
              },
            },
            list = {
              keys = {
                ["<c-h>"] = { "tmux_left", mode = { "i", "n" } },
                ["<c-j>"] = { "tmux_down", mode = { "i", "n" } },
                ["<c-k>"] = { "tmux_up", mode = { "i", "n" } },
                ["<c-l>"] = { "tmux_right", mode = { "i", "n" } },
              },
            },
          },
          layout = { preset = "right" },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
