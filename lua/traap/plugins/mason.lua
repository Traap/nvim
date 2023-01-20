return {
  -- {{{ nvim-lspconfig

  {
    'neovim/nvim-lspconfig',
    cmd = 'Mason',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local language_servers = require('traap.core.constants').language_servers
      local lspconfig = require('lspconfig')

      local xopts = {}
      for _, server in pairs(language_servers) do
        xopts = {
          on_attach = require('traap.servers.lsp.handlers').on_attach,
          capabilities = require('traap.servers.lsp.handlers').capabilities,
        }
        server = vim.split(server, '@')[1]
        local ok, copts = pcall(require, 'traap.servers.lsp.servers' .. server)
        if ok then
          xopts = vim.tbl_deep_extend('force', copts, xopts)
        end
        lspconfig[server].setup(xopts)
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Mason

  {
    'williamboman/mason.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = function()
      return {
        ui = {
          border = 'none',
          icons = {
            package_installed = '◍',
            package_pending = '◍',
            package_uninstalled = '◍',
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      }
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Mason-lspconfig

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = require('traap.core.constants').language_servers,
      automatic_installation = true,
    }
  },

  -- ----------------------------------------------------------------------- }}}
}
