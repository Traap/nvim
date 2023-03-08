-- Set em' first! Things might go sideways while I'm configuring Neovim
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Use my bootstrap method.  Then hand things over to Lazy.
require("config.bootstrap")
require("config.lazy")

-- Setup debuggers that do not have nvim-dap plugins.
require("dbg")
