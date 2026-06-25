-- LSP + Treesitter with traap.core.notify integration
local platform = require("traap.core.platform")

return {
  -- {{{ Mason.nvim

  {
    "mason-org/mason.nvim",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Mason-lspconfig.nvim

  {
    "mason-org/mason-lspconfig.nvim",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = {}, automatic_enable = false }, -- handled dynamically
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-lspconfig with dynamic auto-install

  {
    "neovim/nvim-lspconfig",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    -- {{{ init function

    init = function()
      vim.g.lspconfig = 1

      vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
        desc = "Alias to `:checkhealth vim.lsp`",
      })

      vim.api.nvim_create_user_command("LspLog", function()
        vim.cmd.tabnew(vim.lsp.log.get_filename())
      end, {
        desc = "Open the Nvim LSP client log",
      })

      vim.api.nvim_create_user_command("LspStart", function(info)
        local server_names = #info.fargs > 0 and info.fargs or {}

        if #server_names == 0 then
          local servers = require("traap.config.servers").filetype_to_lsp_server()
          local server = servers[vim.bo.filetype]
          if server then
            server_names = { server }
          end
        end

        if #server_names > 0 then
          vim.lsp.enable(server_names)
        end
      end, {
        complete = function()
          return require("traap.config.servers").lsp_server_names()
        end,
        desc = "Enable and launch a language server",
        nargs = "*",
      })

      vim.api.nvim_create_user_command("LspRestart", function(info)
        local server_names = #info.fargs > 0 and info.fargs or vim
            .iter(vim.lsp.get_clients())
            :map(function(client)
              return client.name
            end)
            :totable()

        for _, server in ipairs(server_names) do
          vim.lsp.enable(server, false)
          if info.bang then
            for _, client in ipairs(vim.lsp.get_clients({ name = server })) do
              client:stop(true)
            end
          end
        end

        vim.defer_fn(function()
          for _, server in ipairs(server_names) do
            vim.lsp.enable(server)
          end
        end, 500)
      end, {
        bang = true,
        complete = function()
          return require("traap.config.servers").lsp_server_names()
        end,
        desc = "Restart the given language server",
        nargs = "*",
      })

      vim.api.nvim_create_user_command("LspStop", function(info)
        local server_names = #info.fargs > 0 and info.fargs or vim
            .iter(vim.lsp.get_clients())
            :map(function(client)
              return client.name
            end)
            :totable()

        for _, server in ipairs(server_names) do
          vim.lsp.enable(server, false)
          if info.bang then
            for _, client in ipairs(vim.lsp.get_clients({ name = server })) do
              client:stop(true)
            end
          end
        end
      end, {
        bang = true,
        complete = function()
          return require("traap.config.servers").lsp_server_names()
        end,
        desc = "Disable and stop the given language server",
        nargs = "*",
      })
    end,

    -- --------------------------------------------------------------------- }}}
    -- {{{ config function

    config = function()
      local notify = require("traap.core.notify")
      local servers = require("traap.config.servers")

      local installed_servers = {}

      -- Capabilities
      ---@class lsp.ClientCapabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities({
        experimental = {
          ghostText = true,
        },
      })

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      vim.diagnostic.config({ signs = { text = signs } })

      local formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

      -- on_attach
      local on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = formatting_group,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end

      local lsp_map = servers.filetype_to_lsp_server()

      -- Auto-install on FileType (restricted to mapped filetypes only)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = servers.filetypes_for_lsp_servers(),
        callback = function(args)
          local ft = args.match
          local server = lsp_map[ft]
          if not server then return end
          if installed_servers[server] then return end
          installed_servers[server] = true

          if servers.is_mason_managed_lsp_server(server) then
            notify.info("Ensuring LSP server: " .. server)
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({ ensure_installed = { server }, automatic_enable = false })
          end

          local server_opts = vim.tbl_deep_extend("force", {
            capabilities = capabilities,
            on_attach = on_attach,
          }, servers.lsp_server_opts(server))

          -- Version-aware API
          if vim.lsp.config and vim.lsp.enable and vim.lsp.config[server] then
            notify.info("Using vim.lsp.config API for " .. server)
            vim.lsp.config(server, server_opts)
            vim.lsp.enable(server)
          else
            notify.warn("Using legacy lspconfig API for " .. server)
            local lspconfig = require("lspconfig")
            if lspconfig[server] then
              lspconfig[server].setup(server_opts)
            else
              notify.error("No config method found for LSP server: " .. server)
            end
          end
        end,
      })
    end,
    -- --------------------------------------------------------------------- }}}
  },
  -- ----------------------------------------------------------------------- }}}
}
