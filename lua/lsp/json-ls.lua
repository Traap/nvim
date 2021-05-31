-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
  filetypes = { "json" }
}
