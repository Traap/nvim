return {
  -- {{{ nvim-lspconfig

  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp'
    },

    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = '●' },
        severity_sort = true,
      },
      autoformat = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = require('traap.core.constants').language_servers,
    },

    config = function(plugin, opts)
      local lspconfig = require('lspconfig')
      local handlers = require('trasp.servers.lsp.handlers')
      local signs = require('traap.constants').diagnostics_signs
      local servers = opts.servers

      for name, icon in pairs(signs) do
        name = 'DiagnosticSign' .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
      end
      vim.diagnostic.config(opts.diagnostics)

      require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers)
      })

      local xopts = {}
      for _, server in pairs(opts.servers) do
        xopts = {
          on_attach = handlers.on_attach,
          capabilities = handlers.capabilities,
          keymaps = handlers.lsp_keymaps,
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
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr> '}, },

    opts = {
      ensure_installed = require('traap.core.constants').language_servers,
    },

    config = function(plugin, opts)
      require ('traap.servers.lsp.handlers').setup()
      require('mason').setup(opts)
      local mr = require('mason-registry')
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ null-ls

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    dependencies = { 'mason.nvim' },
    opts = function()
      local nls = require('null-ls')
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
