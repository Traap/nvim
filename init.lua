-- Initial configuration.
require 'traap.core.bootstrap'
require 'traap.core.functions'
require 'traap.core.customize'
require 'traap.core.options'
require 'traap.core.plugins'

-- Personalize plugins.
require 'traap.plugins.autopairs'
require 'traap.plugins.cmp'
require 'traap.plugins.colorize'
require 'traap.plugins.colorscheme'
require 'traap.plugins.comment'
require 'traap.plugins.fidget'
require 'traap.plugins.friendly-snippets'
require 'traap.plugins.gitsigns'
require 'traap.plugins.impatient'
require 'traap.plugins.lightbulb'
require 'traap.plugins.surround'
require 'traap.plugins.telescope'
require 'traap.plugins.nvim-tree'
require 'traap.plugins.treesitter'
require 'traap.plugins.trouble'
require 'traap.plugins.web-devicons'

-- Lsp
require 'traap.lsp'

-- Items that block
require 'traap.plugins.lualine'
require 'traap.plugins.transparent'

-- Take control of all keybindings.
require 'traap.keys.keybindings'

-- zymurgy : The last word in 1980 Webster's new collegiate dictionary.
require 'traap.core.autocommands'
require 'traap.core.clipboard'
require 'traap.core.zymurgy'
