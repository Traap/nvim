return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
