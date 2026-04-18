local platform = require("traap.core.platform")

return {
  "nvim-neorg/neorg",
  enabled = true and platform.is_nvim(),
  event = require("traap.config.events").file,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
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
