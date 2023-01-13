-- require 'traap.lsp.lsp-zero'
require 'traap.servers.lsp.mason'
require ('traap.servers.lsp.handlers').setup()
require 'traap.servers.lsp.null-ls'

vim.diagnostic.config({
  virtual_text = true,
})
