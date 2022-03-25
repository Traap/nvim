-- {{{ nvim-lsp-installer check.

local  lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_ok then
  return
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Register server handler and install server when necessary.

local use_lsp = require('traap.config').use_lsp

if use_lsp then
  local servers = require('traap.config').language_servers

  for _, name in pairs(servers) do
    local ok, server = lsp_installer.get_server(name)
    if ok then
      -- Register handler.
      server:on_ready(function()
        local opts = {}
        server:setup(opts)
      end)

      -- Install language server.
      if not server:is_installed() then
        server:install()
      else
      end
    end
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Register a handler that will be called for all installed servers.
--
-- Note: This setup() function is exactly the same as lspconfig's setup function.
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach    = require('traap.lsp.handlers').on_attach,
      capabilities = require('traap.lsp.handlers').capabilities,
    }

    if server.name == 'jsonls' then
      local jsonls_opt = require('traap.lsp.settings.jsonls')
      opts = vim.tbl_deep_extend('force', jsonls_opt, opts)
    end

    if server.name == 'sumneko_lua' then
      local sumneko_opt = require('traap.lsp.settings.sumneko_lua')
      opts = vim.tbl_deep_extend('force', sumneko_opt, opts)
    end

    if server.name == 'pyright_lua' then
      local pyright_opt = require('traap.lsp.settings.pyright_lua')
      opts = vim.tbl_deep_extend('force', pyright_opt, opts)
    end

    server:setup(opts)
end)

-- ------------------------------------------------------------------------- }}}
