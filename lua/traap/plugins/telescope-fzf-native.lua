return {
  "nvim-telescope/telescope-fzf-native.nvim",
  enabled = true,

  dependencies = {
    "nvim-telescope/telescope.nvim"
  },

  cmd = "Telescope",

  build = "make",

  cond = function()
    return vim.fn.executable 'make' == 1
  end,

  config = function()
    require("telescope").load_extension("fzf")
  end,
}
