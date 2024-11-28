return {
  "traap/nvim-lightbulb",
  event = "VeryLazy",
  enabled = true,
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    opts = vim.tbl_extend("force", opts or {}, {
      autocmd = { enabled = true }
    })
    return opts
  end,
}
