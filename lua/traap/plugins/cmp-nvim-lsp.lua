return {
  "hrsh7th/cmp-nvim-lsp",
  enabled = true,
  -- event = {"InsertEnter"},
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
}
