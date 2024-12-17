return {
  "folke/which-key.nvim",
  enabled = true,
  keys = {"<leader>", '"', "`", "c", "v", "g"},
  event = require("traap.config.events").file,

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = {
    plugins = { spelling = true }
  },
}
