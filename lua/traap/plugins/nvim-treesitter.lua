return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  build = ":TSUpdate",
}
