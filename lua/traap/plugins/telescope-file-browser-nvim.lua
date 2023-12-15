return {
  "nvim-telescope/telescope-file-browser.nvim",
  enabled = true,

  dependencies = {
    "nvim-telescope/telescope.nvim"
  },

  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
