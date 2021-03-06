-- Bootstrap Packer when needed.
require 'traap.bootstrap'

-- Load my plugins.
require 'traap.plugins'

-- Load utilities my plugins use.
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
require 'traap.friendly-snippets'
require 'traap.alpha'

-- Now colorize
require 'traap.colorize'
require 'traap.colortheme'

-- Take control of all keybindings.
require 'traap.which-key'
require 'traap.keybindings'
