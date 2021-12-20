local  lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_ok then return end

local  servers = require('traap/config').language_servers

-- Automatically install the lanaguage server if supported by
-- nvim-lsp-installer.
for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      print('Installing ' .. name)
      server:install()
    end
  end
end
