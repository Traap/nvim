local platform = require("traap.core.platform")
return {
  "folke/which-key.nvim",
  enabled = true and platform.is_nvim(),
  -- event = require("traap.config.events").file,
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = function(_, opts)
    opts.plugins = { spelling = true }
    opts.preset = "modern"
  end,
}
