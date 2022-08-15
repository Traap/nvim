-- Bootstrap Packer when needed.
require 'traap.bootstrap'

-- Load my plugins.
require 'traap.plugins'

-- Set impatient.
local ok, b16 = pcall(require, 'impatient')
if ok then
  b16.enable_profile()
end

-- Load utilities my plugins use.
require 'traap.utility'

-- The Wild West! ... You have been warned!!!
require 'traap.settings'

-- Configure general plugins.
require 'traap.cmp'
require 'traap.lsp'
require 'traap.lualine'
require 'traap.tree'
require 'traap.web-devicons'

require 'traap.telescope'
require 'traap.treesitter'
require 'traap.friendly-snippets'
require 'traap.alpha'

-- Now colorize
require 'traap.colorize'

-- Take control of all keybindings.
require 'traap.which-key'
require 'traap.keybindings'

-- zymurgy : The last word in 1980 Webster's new collegiate dictionary.
require 'traap.zymurgy'
