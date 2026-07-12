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
    animate      = { enabled = false },
    bufdelete    = { enabled = true },
    bigfile      = { enabled = true },
    dashboard    = {
      enabled = true,
      preset = { header = [[Configured by Traap and powered by lazy.nvim.]] },
    },
    dim          = { enabled = false },
    gh           = { enabled = false },
    git          = { enabled = true },
    gitbrowse    = { enabled = true },
    explorer     = { enabled = true },
    image        = { enabled = not platform.is_windows_nt() },
    indent       = { enabled = false },
    input        = { enabled = not platform.is_vscode() },
    keymap       = { enabled = true },
    layout       = { enabled = false },
    lazygit      = { enabled = false },
    notifier     = {
      enabled = true,
      timeout = 1000,
      top_down = true,
      title_pos = "left",
    },
    picker       = {
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
    quickfile    = { enabled = true },
    rename       = { enabled = true },
    scope        = { enabled = false },
    scratchfile  = { enabled = false },
    scroll       = { enabled = false },
    statuscolumn = { enabled = true },
    terminal     = { enabled = false },
    toggle       = { enabled = true },
    util         = { enabled = false },
    win          = { enabled = false },
    words        = { enabled = true },
    zen          = { enabled = true },
  },
}
