return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  enabled = true,
  keys = { { "<leader>cm", "<cmd>Mason<cr> " }},

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}
