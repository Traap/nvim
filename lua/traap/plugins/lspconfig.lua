return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    ft = {'cpp', 'ruby', 'sql', 'lua'},
    lazy = true,
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

    config = function()
      local notify = require('traap.core.notify')
      local msg_header = 'traap.plugin.lspconfig:\n'

      -- Setup LSP server configuration
      local function setup_server(lsp)
        notify.info(msg_header .. 'Configuring LSP server: ' .. lsp.name)

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        require('lspconfig')[lsp.name].setup {
          capabilities = capabilities,
          filetypes = lsp.filetypes,
          on_attach = function(client, bufnr)
            notify.info(msg_header .. client.name .. ' attached to buffer ' .. bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          end,
        }
      end

      -- Ensure server installation and configuration
      local function ensure_server(lsp)
        local mason_lspconfig = require('mason-lspconfig')
        local installed_servers = mason_lspconfig.get_installed_servers()

        -- Install server if missing
        if not vim.tbl_contains(installed_servers, lsp.name) then
          notify.info(msg_header .. 'Installing LSP server: ' .. lsp.name)
          mason_lspconfig.setup {
            ensure_installed = { lsp.name },
            automatic_installation = true,
          }
          -- Trigger `setup_server` post-install
          mason_lspconfig.on_server_ready(function(server)
            if server.name == lsp.name then
              setup_server(lsp)
            end
          end)
        else
          -- Configure immediately if already installed
          setup_server(lsp)
        end
      end

      -- Autocommand for FileType
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('traap-lsp-file-types', { clear = true }),
        pattern = {'cpp', 'ruby', 'sql', 'lua'},
        callback = function(event)
          local filetype_to_server = {
            cpp = { name = 'clangd', filetypes = { 'cpp' } },
            ruby = { name = 'solargraph', filetypes = { 'ruby' } },
            sql = { name = 'sqls', filetypes = { 'sql' } },
            lua = { name = 'lua_ls', filetypes = { 'lua' } },
          }

          local lsp = filetype_to_server[event.match]
          if not lsp then return end

          -- Ensure server installation and configuration
          ensure_server(lsp)
        end,
      })
    end,
  },
}

