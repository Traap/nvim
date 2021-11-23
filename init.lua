-- Bootstrap Packer when needed.
require 'traap.bootstrap'

-- Time to load all plugins.
require 'traap.plugins'

-- A second start of NeoVim is needed to configure plugins and load treesitter.
if vim.g.nvim_bootstrapped == 0 then
  require 'traap'
end
