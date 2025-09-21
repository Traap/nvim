return {
  -- Mason.nvim
  {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Mason-lspconfig.nvim
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = {} }, -- handled dynamically
  },

  -- nvim-lspconfig with dynamic auto-install
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mason_lsp = require("mason-lspconfig")

      -- ✅ Capabilities
      local capabilities
      if vim.lsp.protocol and vim.lsp.protocol.client_capabilities then
        capabilities = vim.lsp.protocol.client_capabilities()
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end
      capabilities.offsetEncoding = { "utf-16" }
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- 👻 Ghost text support
      capabilities.textDocument.completion.completionItem.insertTextModeSupport = {
        valueSet = { 1, 2 },
      }
      capabilities.experimental = capabilities.experimental or {}
      capabilities.experimental.ghostText = true

      -- ✅ Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- ✅ on_attach
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end

      -- ✅ LSP ↔ Treesitter mapping
      local lsp_map = {
        bash = "bashls",
        c = "clangd",
        cpp = "clangd",
        c_sharp = "omnisharp",
        css = "cssls",
        dockerfile = "dockerls",
        go = "gopls",
        html = "html",
        json = "jsonls",
        julia = "julials",
        latex = "ltex",
        lua = "lua_ls",
        markdown = "marksman",
        nix = "rnix",
        sql = "sqlls",
        svelte = "svelte",
        toml = "taplo",
        tsx = "ts_ls",
        typescript = "ts_ls",
        vim = "vimls",
        yaml = "yamlls",
        xml = "lemminx",
      }

      -- ✅ Auto-install on FileType
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local server = lsp_map[ft]
          if not server then return end

          vim.notify("Ensuring LSP server: " .. server, vim.log.levels.INFO)
          mason_lsp.setup({ ensure_installed = { server } })

          local server_opts = {
            capabilities = capabilities,
            on_attach = on_attach,
          }

          if server == "lua_ls" then
            server_opts.settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
              },
            }
          elseif server == "clangd" then
            server_opts.cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--completion-style=detailed",
              "--header-insertion=never",
            }
          end

          -- ✅ Version-aware API branch with logging
          local nvim_version = vim.version()
          if nvim_version and nvim_version.minor >= 11
            and vim.lsp.config
            and vim.lsp.config[server]
            and vim.lsp.config[server].setup then

            vim.notify("Using new vim.lsp.config API for " .. server, vim.log.levels.INFO)
            vim.lsp.start(vim.lsp.config[server].setup(server_opts))

          else
            vim.notify("Using legacy lspconfig API for " .. server, vim.log.levels.WARN)
            local old = require("lspconfig")
            if old[server] then
              old[server].setup(server_opts)
            else
              vim.notify("No config method found for LSP server: " .. server, vim.log.levels.ERROR)
            end
          end
        end,
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {},
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter.configs")
      ts.setup(opts)

      local parsers = require("nvim-treesitter.parsers")
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local available = parsers.get_parser_configs()[ft]
          if available and not parsers.has_parser(ft) then
            vim.notify("Installing Treesitter parser for " .. ft, vim.log.levels.INFO)
            vim.cmd("TSInstallSync " .. ft)
          end
        end,
      })
    end,
  },
}

