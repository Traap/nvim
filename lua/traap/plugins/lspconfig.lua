return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    ft = vim.tbl_keys(require('traap.config.servers').filetype_to_server),
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
        config = true,
        opts = { ui = { border = 'rounded' }, },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = true,
      },
    },

    -- --------------------------------------------------------------------- }}}
    config = function()
      -- {{{ local definitions

      local servers = require('traap.config.servers')
      local notify = require('traap.core.notify')
      local msg_header = 'traap.plugin.lspconfig:\n'
      local lsp_server_names = servers.lsp_server_names()
      local debug = true

      -- ------------------------------------------------------------------- }}}
      -- {{{ Helper for debug notifications

      local function notify_info(msg)
        if debug then
          notify.info(msg_header .. msg)
        end
      end

      -- ------------------------------------------------------------------- }}}
      -- {{{ LSP capabilities.

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- ------------------------------------------------------------------- }}}
      -- {{{ LSP on attached

      local on_attach = function(client, bufnr)
        notify_info(client.name .. ' attached to buffer ' .. bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end

      -- ------------------------------------------------------------------- }}}
      -- {{{ Autocommand for FileType

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('traap-lsp-file-types', { clear = true }),
        pattern = servers.filetypes_for_lsp_servers,

        callback = function(event)
          local server = servers.filetype_to_server[event.match]
          if not server then return end

          notify_info(server.name .. ' callback fired')

          require('mason').setup()
          require('mason-lspconfig').setup {
            ensure_installed = { server.name },
            automatic_installation = true,
          }

          require('mason-lspconfig').setup_handlers {
            [server.name] = function()
              require('lspconfig')[server.name].setup {
                on_attach = on_attach,
                capabilities = capabilities,
              }
            end,
          }
        end,
      })

      -- ------------------------------------------------------------------- }}}
      -- {{{ Autocommand for BufEnter

      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function(event)
          local buf = event.buf
          local ft = vim.bo[buf].filetype
          local server = servers.filetype_to_server[ft]
          if not server then return end

          local server_names = servers.lsp_server_names
          if not server_names then return end

          for _, server in ipairs(server_names) do
            local attached = false
            for _, client in ipairs(vim.lsp.get_active_clients({bufnr = buf})) do
              if client.name == server.name then
                attached = true
                break
              end

              if not attached then
                notify_info(server.name .. 'attaching to buffer ' .. buf)
                vim.defer_fn(function()
                vim.cmd("LspStart" .. server.name)
              end, 100)
            end
          end
        end,
      })

      -- ------------------------------------------------------------------- }}}
    end,
  },
}
