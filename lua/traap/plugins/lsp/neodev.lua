return {
  "folke/neodev.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
