return {
  "traap/nvim-lightbulb",
  event = require("traap.core.events").file,
  enabled = true,
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    opts = vim.tbl_extend("force", opts or {}, {
      autocmd = { enabled = true }
    })
    return opts
  end,
}
