return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  enable = true,
  event = {"BufReadPost", "BufNewFile"},
  config = false,

  dependencies = {
    "neovim/nvim-lspconfig",
  },
}
