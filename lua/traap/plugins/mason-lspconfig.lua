return {
  "williamboman/mason-lspconfig.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    "williamboman/mason.nvim",
  },
}
