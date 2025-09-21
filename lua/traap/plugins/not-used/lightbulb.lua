return {
  "kosayoda/nvim-lightbulb",
  -- "traap/nvim-lightbulb",
  event = require("traap.config.events").file,
  enabled = true,
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    opts = vim.tbl_extend("force", opts or {}, {
      autocmd = { enabled = true },
      virtual_text = { enabled = true },
    })
    return opts
  end,
}
