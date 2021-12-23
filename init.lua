-- Bootstrap Packer when needed.
require 'traap.bootstrap'

-- Time to load all plugins.
require 'traap.plugins'

-- A second start of NeoVim is needed to plugins I use.
if vim.g.nvim_bootstrapped == 0 then
  -- Utilities first.
  require 'traap.utility'

  -- The Wild West! ... You have been warned1!!!
  require 'traap.settings'

  -- Configure general plugins.
  require 'traap.cmp'
  require 'traap.lsp'
  require 'traap.galaxyline'
  require 'traap.tree'
  require 'traap.web-devicons'
  require 'traap.telescope'
  require 'traap.treesitter'

  -- Now colorize
  require 'traap.colorize'

  -- Take control of all keybindings.
  require 'traap.keybindings'
end
