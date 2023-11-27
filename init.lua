-- Set em' first! Things might go sideways while I'm configuring Neovim
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Bootstrap using lazy.nvim package manager.
require("traap.core.bootstrap")

-- Personalize Neovim.
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.config.lazy")

-- Set colorschme.
vim.cmd("colorscheme tokyonight-moon")

-- LSP configure.
require("traap.lsp.servers")
