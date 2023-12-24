return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
  build = ":TSUpdate",
}
