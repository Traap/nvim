-- {{{ On Attach to Language Server.

function on_attach(client)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>uaua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp config and server names.

local lspconf = require("lspconfig")

-- these langs require same lspconfig so put em all in a table and loop through!
local servers = {
  "bashls", 
  "html", 
  "jsonls", 
  "pyright", 
  "rust_analyzer",
  "sumneko_lua",
  "solargraph",
  "texlab",
  "tsserver",
  "vimls", 
  "yamlls",
}

for _, lang in ipairs(servers) do
  lspconf[lang].setup {
    on_attach = on_attach,
    root_dir = vim.loop.cwd
  }
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vls conf example

local vls_binary = "/usr/local/bin/vls"
lspconf.vls.setup {
  cmd = {vls_binary}
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Common On Attach 

function lsp_config.common_on_attach(client, bufnr)
  -- print('client: ', client)
  -- print(' bufnr: ', bufnr)
  documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
  lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Require Language Servers 

-- require('lsp.bash-ls')
-- require('lsp.html-ls')
-- require('lsp.json-ls')
-- require('lsp.latex-ls')
-- require('lsp.lua-ls')
-- require('lsp.python-ls')
-- require('lsp.ruby-ls')
-- require('lsp.rust-ls')
-- require('lsp.vim-ls')
-- require('lsp.yaml-ls')

-- ------------------------------------------------------------------------- }}}
-- {{{ replace the default lsp diagnostic letters with prettier symbols

local sign_define = vim.fn.sign_define

sign_define("LspDiagnosticsSignError", 
            {text = "", numhl = "LspDiagnosticsDefaultError"})

sign_define("LspDiagnosticsSignWarning", 
            {text = "", numhl = "LspDiagnosticsDefaultWarning"})

sign_define("LspDiagnosticsSignInformation", 
           {text = "", numhl = "LspDiagnosticsDefaultInformation"})

sign_define("LspDiagnosticsSignHint", 
           {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- ------------------------------------------------------------------------- }}}
