-- Make Snacks global.
Snacks = Snacks
local platform = require("traap.core.platform")
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enable = true and platform.is_nvim(),

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
      actions = {
        tmux_left  = function(_) vim.cmd("TmuxNavigateLeft") end,
        tmux_down  = function(_) vim.cmd("TmuxNavigateDown") end,
        tmux_up    = function(_) vim.cmd("TmuxNavigateUp") end,
        tmux_right = function(_) vim.cmd("TmuxNavigateRight") end,
      },
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
          layout = { layout = { position = "right" } },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.inlay_hints():map("yoh")
        Snacks.toggle.indent():map("yoi")
        Snacks.toggle.line_number():map("yon")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("yor")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("yos")
        Snacks.toggle.treesitter():map("yot")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("yow")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
