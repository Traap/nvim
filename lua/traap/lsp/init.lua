local  status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end

require 'traap.lsp.lsp-signature'
require 'traap.lsp.lsp-installer'
require('traap.lsp.handlers').setup()
require 'traap.lsp.null-ls'
