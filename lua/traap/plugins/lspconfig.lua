-- LSP + Treesitter with traap.core.notify integration

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
      local notify = require("traap.core.notify")

      -- Capabilities
      local capabilities
      if vim.lsp.protocol and vim.lsp.protocol.client_capabilities then
        capabilities = vim.lsp.protocol.client_capabilities()
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end
      capabilities.offsetEncoding = { "utf-16" }
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.insertTextModeSupport =
        {
          valueSet = { 1, 2 },
        }
      capabilities.experimental = capabilities.experimental or {}
      capabilities.experimental.ghostText = true

      -- Diagnostic signs
      local signs =
        { Error = " ", Warn = " ", Hint = " ", Info = " " }
      vim.diagnostic.config({ signs = { text = signs } })

      -- on_attach
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set(
  map.    "n",
 set("n", "<leader>wa",
 der>wa", vim.lsp.buf.add_workspace_folder,
 _fold    opts
er, opts)
        vim.keymap.set(
  map.    "n",
 set("n", "<leader>wr",
 der>wr", vim.lsp.buf.remove_workspace_folder,
 _fold    opts
er, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
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
        c_sharp = "omnisharp",
        css = "cssls",
        dockerfile = "dockerls",
        go = "gopls",
        html = "html",
        java = "jdtls",
        json = "jsonls",
        julia = "julials",
        latex = "ltex",
        lua = "lua_ls",
        markdown = "marksman",
        nix = "rnix",
        python = "pyright",
        ruby = "solargraph",
        sql = "sqlls",
        svelte = "svelte",
        tex = "texlab",
        toml = "taplo",
        tsx = "ts_ls",
        typescript = "ts_ls",
        vim = "vimls",
        yaml = "yamlls",
        zig = "zls",
        xml = "lemminx",
      }

      -- Auto-install on FileType
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local server = lsp_map[ft]
          if not server then
 erver t    returnhen return end

          notify.info("Ensuring LSP server: " .. server)
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

          -- Version-aware API
          local nvim_version = vim.version()
          if
         if nvim_version
 im_version and nvim_version.minor >= 11
 inor >= 11 and vim.lsp.config
 lsp.config and vim.lsp.config[server]ig[server] then
            notify.info("Using new vim.lsp.config API for " .. server)
            vim.lsp.start(
    lsp.start(vim.tbl_deep_extend("force", vim.lsp.config[server], server_opts)
  rver_opts))
          else
            notify.warn("Using legacy lspconfig API for " .. server)
            local old = require("lspconfig")
            if old[server] then
              old[server].setup(server_opts)
            else
              notify.error("No config method found for LSP server: " .. server)
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
      local notify = require("traap.core.notify")

      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if not ok then
        notify.warn("nvim-treesitter.configs not available")
        return
      end
      ts.setup(opts)

      local parsers = require("nvim-treesitter.parsers")
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local available = parsers.get_parser_configs()[ft]
          if available and not parsers.has_parser(ft) then
            notify.info("Installing Treesitter parser for " .. ft)
            vim.cmd("TSInstallSync " .. ft)
          end
        end,
      })
    end,
  },
}
