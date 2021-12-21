-- {{{ nvim-lsp-installer check.

local  lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Register a handler that will be called for all installed servers.
--
-- Note: This setup() function is exactly the same as lspconfig's setup function.
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lsp_installer.on_server_ready(function(server)
    local opts = {}
      print('On Server Ready ' .. server.name)
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    server:setup(opts)
end)

-- ------------------------------------------------------------------------- }}}
-- {{{ Register server handler and install server when necessary.

local  servers = require('traap/config').language_servers

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
      print('Installing ' .. name)
      server:install()
    end
  end
end

-- ------------------------------------------------------------------------- }}}
