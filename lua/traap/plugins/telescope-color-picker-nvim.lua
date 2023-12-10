return {
  "exosyphon/telescope-color-picker.nvim",
  enabled = true,

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    { "<leader>uC", "<cmd>Telescope colors<cr>", { desc = "Telescope Color Picker"} },
  },

  config = function()
    require("telescope").load_extension("colors")
  end,
}
