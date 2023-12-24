return {
  "williamboman/mason.nvim",
  enable = true,
  cmd = {"Mason", "MasonInstall", "MasonInstall", "MasonUpdate"},
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", "Mason toggle" },
  },
}
