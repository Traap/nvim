-- Configure neovim environment.
require 'config.settings'

-- Configure plugins
require 'config.compe-completion'
require 'config.galaxyline-nvim'
require 'config.nvim-tree'
require 'config.nvim-web-devicons'
require 'config.telescope-nvim'
require 'config.treesitter-nvim'
require 'config.vimtex'
require 'config.wiki-vim'

-- Now colorize
require('colorizer').setup()

-- Take control of all keybindings.
require 'config.keybindings'

-- Enable language servers.
require 'config.language-servers'
