-- These languages use the samme lspconfig.

local lspconf = require('lspconfig')

local servers = {
  'bashls',
  'html',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sumneko_lua',
  'solargraph',
  'texlab',
  'tsserver',
  'vimls',
  'yamlls',
}

for _, lang in ipairs(servers) do
  lspconf[lang].setup {
    on_attach = on_attach,
    root_dir = vim.loop.cwd
  }
end

