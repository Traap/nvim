return {
  "kosayoda/nvim-lightbulb",
  event = "BufReadPre",
  enabled = true,
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    opts.autocmd = { enabled = true }
  end,
}
