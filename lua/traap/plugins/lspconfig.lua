return {
  -- {{{ lazydev
  -- configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ luvit-meta

  -- { 'Bilal2453/luvit-meta' },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Main LSP Configuration
  {
    'neovim/nvim-lspconfig',
    ft = require('traap.config.events').ft,
    dependencies = {
      { 'williamboman/mason.nvim',
        opts = {
          ui = {
            border = "rounded"
          },
        },
        config = true,
      }, -- NOTE: Must be loaded before dependants

      {'williamboman/mason-lspconfig.nvim'},
      {'WhoIsSethDaniel/mason-tool-installer.nvim'},
      { 'j-hui/fidget.nvim', opts = {} },
      {'hrsh7th/cmp-nvim-lsp'},
    },

    config = function()

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'bash-language-server',
        'clangd',
        'css-lsp',
        'emmet-ls',
        'eslint-lsp',
        'flake8',
        'gopls',
        'html-lsp',
        'json-lsp',
        'lua-language-server',
        'omnisharp',
        'pyright',
        'rust-analyzer',
        'shellcheck',
        'shfmt',
        'solargraph',
        'sqlls',
        'stylua',
        'texlab',
        'typescript-language-server',
        'yaml-language-server',
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('traap_glsp-attach', { clear = true }),
        callback = function(event)

          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
          -- if client and
          --    client.supports_method(
            --   vim.lsp.protocol.Methods.textDocument_documentHighlight
            -- ) then
            --
            local highlight_augroup = vim.api.nvim_create_augroup(
              'traap_glsp-highlight', { clear = false }
            )

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup(
                'traap_glsp-detach', { clear = true }
              ),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds {
                  group = 'traap_glsp-highlight', buffer = event2.buf
                }
              end,
            })
          end

          if client and
             client.supports_method(
              vim.lsp.protocol.Methods.textDocument_inlayHint
            ) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
              )
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        'force', capabilities, require('cmp_nvim_lsp').default_capabilities()
      )

      require('mason').setup()
      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed
      }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- ------------------------------------------------------------------------ }}}
}
