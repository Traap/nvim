-- npm install -g yaml-language-server
require'lspconfig'.yamlls.setup{
  filetypes = { "yaml", "yml" }
}
