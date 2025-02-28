return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = false,
  event = require("traap.config.events").file,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
