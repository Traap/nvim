local lsp_installer = require('nvim-lsp-installer')
local servers = require('traap/config').language_servers

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
