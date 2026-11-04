local platform = require("traap.core.platform")

return {
  "nvim-neorg/neorg",
  enabled = false and platform.is_nvim(),
  event = require("traap.config.events").file,
  version = "*",
  -- nvim-treesitter now ships the norg parser. The standalone
  -- tree-sitter-norg repositories are no longer the install path.
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
