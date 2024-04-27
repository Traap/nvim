return {
  "folke/which-key.nvim",
  enabled = true,
  keys = {"<leader>", "<c-r>", "<c-w>", '"', "`", "c", "v", "g"},
  event = {"InsertEnter"},

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = {
    plugins = { spelling = true }
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
