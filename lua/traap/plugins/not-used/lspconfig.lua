return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  enabled = true,
  lazy = true,
  -- {{{ Dependencies

    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      {
        'williamboman/mason.nvim',
        -- event = 'VimEnter',
        opts = { ui = { border = 'rounded' } },
        config = function(_, opts)
          require('mason').setup(opts)
        end,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        -- event = 'VimEnter',
        dependencies = { 'mason.nvim' },
        -- We'll configure handlers below in one place
      },
    },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Custom configuration.

    config = function()
      local servers = require('traap.config.servers').lsp_server_names()
      local notify  = require('traap.core.notify')

      -- Common capabilities and on_attach for all servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local on_attach = function(client, bufnr)
        notify.info('[traap] ' .. client.name .. ' attached to buffer ' .. bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover,      bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,      bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end

      -- Setup Mason + Mason-LSPConfig in one call
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed      = servers,
        automatic_installation = true,
        handlers = {
          -- Default handler for all servers
          function(server_name)
            require('lspconfig')[server_name].setup {
              on_attach    = on_attach,
              capabilities = capabilities,
            }
          end,
        },
      }
    end,
  -- ----------------------------------------------------------------------- }}}
}
