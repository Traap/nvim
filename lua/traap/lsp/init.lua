local  ok, _ = pcall(require, 'lspconfig')
if not ok then return end

require 'traap.lsp.mason'
require ('traap.lsp.handlers').setup()
require 'traap.lsp.null-ls'
