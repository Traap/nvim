-- Let show begin.

-- Bootstrap Packer when needed.
require 'bootstrap'

-- Time to load all plugins.
require 'plugins'

-- Plugin are configured when nvim is not bootstrapped.
if vim.g.nvim_bootstrapped == 0 then
  require 'config'
end
