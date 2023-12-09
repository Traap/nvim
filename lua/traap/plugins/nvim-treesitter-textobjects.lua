return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  dependency = {
    "nvim-treesitter/nvim-treesitter",
  },
}
