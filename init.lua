-- Initial configuration.
require 'traap.core.bootstrap'
require 'traap.core.functions'
require 'traap.core.customize'
require 'traap.core.options'
require 'traap.core.plugins'

-- Personalize plugins.
require 'traap.packer.autopairs'
require 'traap.packer.cmp'
require 'traap.packer.colorize'
require 'traap.packer.colorscheme'
require 'traap.packer.comment'
require 'traap.packer.fidget'
require 'traap.packer.friendly-snippets'
require 'traap.packer.gitsigns'
require 'traap.packer.impatient'
require 'traap.packer.lightbulb'
require 'traap.packer.surround'
require 'traap.packer.telescope'
require 'traap.packer.nvim-tree'
require 'traap.packer.treesitter'
require 'traap.packer.trouble'
require 'traap.packer.web-devicons'

-- Lsp
require 'traap.lsp'

-- Items that block
-- require 'traap.packer.lualine'
-- require 'traap.packer.transparent'

-- Take control of all keybindings.
require 'traap.keys.keybindings'

-- zymurgy : The last word in 1980 Webster's new collegiate dictionary.
require 'traap.core.autocommands'
require 'traap.core.clipboard'
require 'traap.core.zymurgy'
