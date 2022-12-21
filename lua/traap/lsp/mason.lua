-- {{{ Bail when requried packages are not loaded.q

local  mok, mason = pcall(require, 'mason')
if not mok then return end

local  aok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not aok then return end


local  lok, lspconfig = pcall(require, 'lspconfig')
if not lok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP servers to install

local servers = {
  'eslint',
  'jsonls',
  'omnisharp',
  'pyright',
  'solargraph',
  'sumneko_lua',
  'texlab',
  'tsserver',
  'yamlls',
}

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP settings

local settings = {
  ui = {
    border = 'none',
    icons = {
      package_installed = '◍',
      package_pending = '◍',
      package_uninstalled = '◍',
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Configur mason and mason_lspconfig

mason.setup(settings)

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = false,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Configure on_attach and capabilities.

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('traap.lsp.handlers').on_attach,
    capabilities = require('traap.lsp.handlers').capabilities,
  }

  server = vim.split(server, '@')[1]

  local require_ok, conf_opts = pcall(require, 'traap.lsp.settings.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

-- ------------------------------------------------------------------------- }}}