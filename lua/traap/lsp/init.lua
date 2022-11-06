local  status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end

require('mason').setup()
require('mason-lspconfig').setup()
require('null-ls').setup()
require('mason-null-ls').setup()

require 'traap.lsp.lsp-signature'
-- require 'traap.lsp.lsp-installer'
require('traap.lsp.handlers').setup()
