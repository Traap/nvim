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
    opts = { ensure_installed = {} }, -- handled dynamically
  },

  -- nvim-lspconfig with dynamic auto-install
  {
    "neovim/nvim-lspconfig",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mason_lsp = require("mason-lspconfig")
      local notify = require("traap.core.notify")
      local lspconfig = require("lspconfig")

      local installed_servers = {}

      -- Capabilities
      ---@class lsp.ClientCapabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.insertTextModeSupport = {
        valueSet = { 1, 2 },
      }
      capabilities.experimental = capabilities.experimental or {}
      capabilities.experimental.ghostText = true

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      vim.diagnostic.config({ signs = { text = signs } })

      local formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

      -- on_attach
      local on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = formatting_group,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end

      -- LSP ↔ Treesitter mapping
      local lsp_map = {
        bash = "bashls",
        c = "clangd",
        cpp = "clangd",
        c_sharp = "csharp_ls",
        css = "cssls",
        -- dockerfile = "dockerls",
        go = "gopls",
        html = "html",
        java = "jdtls",
        json = "jsonls",
        julia = "julials",
        latex = "ltex",
        lua = "lua_ls",
        markdown = "marksman",
        nix = "nixd",
        python = "pyright",
        ruby = "solargraph",
        sql = "sqls",
        svelte = "svelte-language-server",
        tex = "texlab",
        toml = "taplo",
        tsx = "ts_ls",
        typescript = "ts_ls",
        vim = "vimls",
        yaml = "yamlls",
        zig = "zls",
        xml = "lemminx",
      }

      -- Auto-install on FileType (restricted to mapped filetypes only)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = vim.tbl_keys(lsp_map),
        callback = function(args)
          local ft = args.match
          local server = lsp_map[ft]
          if not server then return end

          notify.info("Ensuring LSP server: " .. server)
          mason_lsp.setup({ ensure_installed = { server } })

          local server_opts = {
            capabilities = capabilities,
            on_attach = on_attach,
          }

          if server == "lua_ls" then
            server_opts.settings = {
              Lua = {
                diagnostics = { globals = { "vim", "Snacks" } },
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

          -- Version-aware API
          local nvim_version = vim.version()
          if nvim_version and nvim_version.minor >= 10 and vim.lsp.config and vim.lsp.config[server] then
            notify.info("Using new vim.lsp.config API for " .. server)
            vim.lsp.start(vim.tbl_deep_extend("force", vim.lsp.config[server], server_opts))
          else
            if installed_servers[server] then
              return
            end
            installed_servers[server] = true
            notify.warn("Using legacy lspconfig API for " .. server)
            if lspconfig[server] then
              lspconfig[server].setup(server_opts)
            else
              notify.error("No config method found for LSP server: " .. server)
            end
          end
        end,
      })
    end,
  },
}
