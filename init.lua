-- Let show begin.
local g = vim.g

-- Bootstrap Packer when needed.
require 'bootstrap'

-- Time to load all plugins.
require 'plugins'

-- Plugin are configured when nvim is not bootstrapped.
if g.nvim_bootstrapped == 0 then
  require 'traap'
end

