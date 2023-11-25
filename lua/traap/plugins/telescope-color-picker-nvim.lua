return {
  "exosyphon/telescope-color-picker.nvim",
  enable = true,

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    { "<leader>uC", "<cmd>Telescope colors<cr>", { desc = "Telescope Color Picker"} },
  },
}
