-- {{{ Credits

-- https://github.com/hackorum/nfs
-- https://github.com/LunarVim/Neovim-From-Scratch

local  ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Metatable M

local M = {}

-- ------------------------------------------------------------------------- }}}
-- {{{ M.setup

M.setup = function()

  local signs = require('traap.config').diagnostic_signs

  for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = ""
    })
  end

  local config = {
    float = {
      border = 'rounded',
      focusable = true,
      header = '',
      prefix = '',
      source = 'always',
      style = 'minimal',
    },
    severity_sort = true,
    signs = { active = signs},
    underline = true,
    update_in_insert = true,
    virtual_text = false,
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = 'rounded', }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = 'rounded', }
  )
end

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp_keymaps

local function lsp_keymaps(bufnr)
  local opts = {noremap = true, silent = true}
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, 'n', '<leader>ca', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>fd', [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>k',  [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>q',  [[<cmd>lua vim.diagnostic.setloclist()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>rn', [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  keymap(bufnr, 'n', '<leader>f',  [[<cmd>lua vim.lsp.buf.formatting<CR>]], opts)

  keymap(bufnr, 'n', 'K',          [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)

  keymap(bufnr, 'n', 'gD',         [[<cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
  keymap(bufnr, 'n', 'gd',         [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)

  keymap(bufnr, 'n', 'gI',         [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  keymap(bufnr, 'n', 'gl',         [[<cmd>lua vim.diagnostic.open_float()<CR>]], opts)

  keymap(bufnr, 'n', 'gr',         [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)

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

  if client.name == "sumneko_lua" then
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
-- {{{ capabilities

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Metatable M

return M

-- ------------------------------------------------------------------------- }}}
