-- Set em' first! Things might go sideways while I'm configuring Neovim
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Use my bootstrap method.  Then hand things over to Lazy.
require("config.traap.bootstrap")
require("config.lazy")
