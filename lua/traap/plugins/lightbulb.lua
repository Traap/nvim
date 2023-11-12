require("traap.core.globals")

local plugin = "nvim-lightbulb"

return {
  "kosayoda/" .. plugin,
  event = "BufReadPre",
  enabled = Is_Enabled(plugin),
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    opts.autocmd = { enabled = true }
  end,
}
