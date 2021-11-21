-- Bootstrap Packer when needed.
require 'traap.bootstrap'

-- Time to load all plugins.
require 'traap.plugins'

-- Plugin are configured when nvim is not bootstrapped.
local g = vim.g
if g.nvim_bootstrapped == 0 then
  require 'traap'
end
