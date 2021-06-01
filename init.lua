
-- Let show begin.

-- Bootstrap Packer when needed.
require 'bootstrap'

-- Time to load all plugins.
require 'plugins'

-- Finish configuring neovim environment.
require 'settings'

-- Now we can configure our plugins.
require 'config'

-- Take control of all keybindings.
require 'keybindings'

-- Enable language servers.
require 'language-servers'
