-- Disable plugins.  See TJ DeVries.
require 'traap.disable_builtin'

-- Configure neovim environment.
require 'traap.settings'

-- Configure plugins
-- require 'traap.compe-completion'
require 'traap.nvim-cmp'
require 'traap.cmp-buffer'
require 'traap.cmp-nvim-lua'
require 'traap.cmp-nvim-lsp'
require 'traap.galaxyline-nvim'
require 'traap.nvim-tree'
require 'traap.nvim-web-devicons'
require 'traap.telescope-nvim'
require 'traap.treesitter-nvim'
require 'traap.wiki-vim'

-- Now colorize
require('colorizer').setup()
require('traap.highlights')

-- Take control of all keybindings.
require 'traap.keybindings'

-- Enable language servers.
require 'traap.language-servers'

-- The Wild West! ... You have been warned1!!!
require 'traap.os-check'
