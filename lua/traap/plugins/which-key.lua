return {
  "folke/which-key.nvim",
  enabled = true,
  keys = {"<leader>", "<c-r>", "<c-w>", '"', "`", "c", "v", "g"},
  event = {"InsertEnter"},

  opts = {
    plugins = { spelling = true }
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
