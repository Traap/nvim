-- Configure neovim environment and plugins.

require 'config.compe-completion'
require 'config.galaxyline-nvim'
require 'config.keybindings'
require 'config.nvim-tree'
require 'config.nvim-web-devicons'
require 'config.settings'
require 'config.telescope-nvim'
require 'config.treesitter-nvim'
require 'config.vimtex'
require 'config.wiki-vim'

-- Now colorize
require('colorizer').setup()
