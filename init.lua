-- Take control of my leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap using lazy.nvim package manager.
require("traap.config.bootstrap")

-- Personalize Lazy.nvim and Lazy.vim
require("traap.config.lazy")

-- Apply my customizations.
vim.cmd.colorscheme(require("traap.config.colorscheme").name)
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.core.clipboard")

require("traap.core.working").whosePlugins()
