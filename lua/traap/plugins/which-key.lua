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

  -- plugins.spelling is a table in which-key 3. A boolean used to be enough,
  -- and assigning a new plugins table would drop marks, registers, and presets
  -- before which-key merges its defaults.
  opts = function(_, opts)
    opts.preset = "modern"
    opts.plugins = vim.tbl_deep_extend("force", opts.plugins or {}, {
      spelling = { enabled = true, suggestions = 20 },
    })
    return opts
  end,
}
