-- Take control of my leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.lazyvim_check_order = false

-- Bootstrap using lazy.nvim package manager.
require("traap.config.bootstrap")

-- Personalize Lazy.nvim and Lazy.vim
require("traap.config.lazy")

-- Apply my customizations.
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.core.clipboard")
vim.cmd.colorscheme(require("traap.config.colorscheme").name)
-- require("traap.core.working").whosePlugins()
