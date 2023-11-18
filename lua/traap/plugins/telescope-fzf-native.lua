return {
  "nvim-telescope/telescope-fzf-native.nvim",
  enabled = true,
  cmd = "Telescope",
  build = "make",
  config = function()
    require("telescope").load_extension("fzf")
  end,
}
