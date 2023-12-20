return {
  "williamboman/mason.nvim",
  enable = true,
  event = "VeryLazy",
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", "Mason toggle" },
  },
}
