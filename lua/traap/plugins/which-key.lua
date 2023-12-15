return {
  "folke/which-key.nvim",
  enabled = true,
  -- event = {"InsertEnter", "CmdLineEnter"},
  event = "VeryLazy",

  opts = {
    plugins = { spelling = true }
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
