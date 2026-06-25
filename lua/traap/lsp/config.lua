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

M.configure_diagnostics = function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  vim.diagnostic.config({ signs = { text = signs } })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ on_attach

M.on_attach = function()
  local formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

  return function(client, bufnr)
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
end

-- ------------------------------------------------------------------------- }}}
-- {{{ configure_server

M.configure_server = function(server, opts)
  local notify = require("traap.core.notify")

  if vim.lsp.config and vim.lsp.enable and vim.lsp.config[server] then
    notify.info("Using vim.lsp.config API for " .. server)
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
    return
  end

  notify.warn("Using legacy lspconfig API for " .. server)
  local lspconfig = require("lspconfig")
  if lspconfig[server] then
    lspconfig[server].setup(opts)
  else
    notify.error("No config method found for LSP server: " .. server)
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

  notify.info("Ensuring LSP server: " .. server)
  local mason_lsp = require("mason-lspconfig")
  mason_lsp.setup({ ensure_installed = { server }, automatic_enable = false })
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
      if not server then return end
      if installed_servers[server] then return end
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
