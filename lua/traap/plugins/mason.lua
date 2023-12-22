return {
  "williamboman/mason.nvim",
  enable = true,
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", "Mason toggle" },
  },
}
