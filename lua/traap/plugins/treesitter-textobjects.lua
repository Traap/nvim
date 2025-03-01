return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = true,
  event = require("traap.config.events").file,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
