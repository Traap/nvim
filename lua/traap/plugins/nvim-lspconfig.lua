return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = "VeryLazy",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
}
