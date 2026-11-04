-- Native LSP for Neovim 0.11 and later. Server definitions come from
-- nvim-lspconfig's `lsp/*.lua` files. This module merges capabilities and
-- enables one server per filetype. It does not call lspconfig's setup()
-- framework. That framework is deprecated and removed in nvim-lspconfig v3.
local M = {}
local installed_servers = {}
-- {{{ capabilities

M.capabilities = function()
  ---@class lsp.ClientCapabilities
  return require("blink.cmp").get_lsp_capabilities({
    experimental = {
      ghostText = true,
    },
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ diagnostic

local diagnostic_text

M.toggle_diagnostic_text = function()
  local config = vim.diagnostic.config() or {}
  if config.virtual_text or config.virtual_lines then
    diagnostic_text = {
      virtual_text = config.virtual_text,
      virtual_lines = config.virtual_lines,
    }
    vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
  else
    vim.diagnostic.config(diagnostic_text or { virtual_text = true })
  end
end

M.configure_diagnostics = function()
  -- Nerd Font 3 moved the old codicon code points. Use the icon table.
  local icons = require("traap.config.icons").diagnostics
  local severity = vim.diagnostic.severity
  vim.diagnostic.config({
    signs = {
      text = {
        [severity.ERROR] = icons.Error,
        [severity.WARN] = icons.Warning,
        [severity.HINT] = icons.Hint,
        [severity.INFO] = icons.Information,
      },
    },
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ on_attach

M.on_attach = function()
  local formatting_group =
    vim.api.nvim_create_augroup("LspFormatting", { clear = false })

  return function(client, bufnr)
    -- bufnr matters: formatting can be registered per buffer.
    if client:supports_method("textDocument/formatting", bufnr) then
      vim.api.nvim_clear_autocmds({ group = formatting_group, buf = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = formatting_group,
        buf = bufnr,
        callback = function()
          -- csv, sh, and tex set vim.b.autoformat in autocmds.lua.
          if vim.b[bufnr].autoformat == false then
            return
          end
          vim.lsp.buf.format({ async = false, bufnr = bufnr })
        end,
      })
    end
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ configure_server

M.configure_server = function(server, opts)
  local notify = require("traap.core.notify")

  -- vim.lsp.config() merges opts over lsp/<server>.lua. Do not index
  -- vim.lsp.config[server] first: that resolves and caches before the merge.
  local ok, err = pcall(function()
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  end)
  if not ok then
    notify.error("Failed to enable " .. server .. ": " .. tostring(err))
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ ensure_mason_server

M.ensure_mason_server = function(server)
  local notify = require("traap.core.notify")
  local servers = require("traap.lsp.servers")

  if not servers.is_mason_managed_lsp_server(server) then
    return
  end

  -- mason-lspconfig setup() replaces ensure_installed. Install this one
  -- package through the registry instead of calling setup() again.
  local ok_mason, mason = pcall(require, "mason")
  if not ok_mason then
    notify.error("mason.nvim is not available for " .. server)
    return
  end
  if not mason.has_setup then
    mason.setup()
  end

  local registry = require("mason-registry")
  registry.refresh(vim.schedule_wrap(function(success)
    if not success then
      notify.warn("Mason registry refresh failed for " .. server)
      return
    end

    local pkg_name =
      require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package[server]
    if not pkg_name then
      notify.warn(
        server
          .. " is not in the Mason registry. Set mason = false or install it on PATH."
      )
      return
    end

    local ok_pkg, pkg = pcall(registry.get_package, pkg_name)
    if not ok_pkg then
      notify.warn("Mason package missing for " .. server .. ": " .. pkg_name)
      return
    end
    if pkg:is_installed() or pkg:is_installing() then
      return
    end

    notify.info("Installing LSP server: " .. server)
    pkg:install()
  end))
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_filetype_autocmd

M.create_filetype_autocmd = function()
  local servers = require("traap.lsp.servers")
  local lsp_map = servers.filetype_to_lsp_server()
  local capabilities = M.capabilities()
  local on_attach = M.on_attach()

  vim.api.nvim_create_autocmd("FileType", {
    pattern = servers.filetypes_for_lsp_servers(),
    callback = function(args)
      local ft = args.match
      local server = lsp_map[ft]
      if not server then
        return
      end
      if installed_servers[server] then
        return
      end
      installed_servers[server] = true

      M.ensure_mason_server(server)

      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, servers.lsp_server_opts(server))

      M.configure_server(server, server_opts)
    end,
  })
end

-- ------------------------------------------------------------------------- }}}
return M
