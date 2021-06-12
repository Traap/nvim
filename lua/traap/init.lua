-- Configure neovim environment.
require 'traap.settings'

-- Configure plugins
require 'traap.compe-completion'
require 'traap.galaxyline-nvim'
require 'traap.nvim-tree'
require 'traap.nvim-web-devicons'
require 'traap.telescope-nvim'
require 'traap.treesitter-nvim'

-- Now colorize
require('colorizer').setup()
require('traap.highlights')

-- Take control of all keybindings.
require 'traap.keybindings'

-- Enable language servers.
require 'traap.language-servers'
