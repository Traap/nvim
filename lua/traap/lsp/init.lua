require 'traap.lsp.mason'
require ('traap.lsp.handlers').setup()
require 'traap.lsp.null-ls'

vim.diagnostic.config({
  virtual_text = true,
})
