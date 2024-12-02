return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = true,
  event = require("traap.core.events").file,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
