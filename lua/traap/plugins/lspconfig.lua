-- LSP + Treesitter with traap.core.notify integration
local platform = require("traap.core.platform")

return {
  -- Mason.nvim
  {
    "mason-org/mason.nvim",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Mason-lspconfig.nvim
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = {}, automatic_enable = false }, -- handled dynamically
  },


  -- nvim-lspconfig with dynamic auto-install
  {
    "neovim/nvim-lspconfig",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },

    init = function()
      local init = require("traap.lsp.init")

      init.claim_lspconfig_commands()
      init.create_lsp_info_command()
      init.create_lsp_log_command()
      init.create_lsp_start_command()
      init.create_lsp_restart_command()
      init.create_lsp_stop_command()
    end,

    config = function()
      local config = require("traap.lsp.config")

      config.configure_diagnostics()
      config.create_filetype_autocmd()
    end,
  },
}
