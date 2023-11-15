return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
}
