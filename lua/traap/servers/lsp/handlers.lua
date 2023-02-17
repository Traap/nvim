-- {{{ Metatable M

local M = {}

-- ------------------------------------------------------------------------- }}}
-- {{{ M.on_attach

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "lua_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Capabilities

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Metatable M

return M

-- ------------------------------------------------------------------------- }}}
