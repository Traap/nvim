local platform = require("traap.core.platform")

return {
  "nvim-neorg/neorg",
  enabled = true and platform.is_nvim(),
  event = require("traap.config.events").file,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "nvim-neorg/tree-sitter-norg",
      event = require("traap.config.events").file,
    },
    {
      "nvim-neorg/tree-sitter-norg-meta",
      event = require("traap.config.events").file,
    },
  },

  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.integrations.treesitter"] = {
          config = {
            configure_parsers = true,
            install_parsers = true,
          },
        },
      },
    })
  end,
}
