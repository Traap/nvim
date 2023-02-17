-- {{{ Metatable M

local M = {}

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp_keymaps

local function lsp_keymaps(bufnr)
  local opts = {noremap = true, silent = true}
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, 'n', '<leader>D',  [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>K',  [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>Q',  [[<cmd>lua vim.diagnostic.setloclist()<CR>]], opts)

  keymap(bufnr, 'n', '<leader>aF',  [[<cmd>LspToggleAutoFormat<CR>]], opts)
  keymap(bufnr, 'n', '<leader>af',  [[<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>]], opts)

  keymap(bufnr, 'n', '<leader>ca', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>ds', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>rn', [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>ws', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], opts)

  keymap(bufnr, 'n', 'K',          [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)

  keymap(bufnr, 'n', 'gD',         [[<cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
  keymap(bufnr, 'n', 'gd',         [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)

  keymap(bufnr, 'n', 'gI',         [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  keymap(bufnr, 'n', 'gl',         [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)

  keymap(bufnr, 'n', 'gr',         [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
  keymap(bufnr, 'n', 'gR',         [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)

  keymap(bufnr, 'n', '[d',         [[<cmd>lua vim.diagnostic.goto_prev()<CR>]], opts)
  keymap(bufnr, 'n', ']d',         [[<cmd>lua vim.diagnostic.goto_next()<CR>]], opts)


  vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]
end

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
