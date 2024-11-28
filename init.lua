-- Take control of my leader keys.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Bootstrap using lazy.nvim package manager.
require("traap.core.bootstrap")

-- Personalize Lazy.nvim and Lazy.vim
require("traap.config.lazy")

-- Apply my customizations.
vim.cmd.colorscheme(require("traap.core.constants").colorscheme)
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.core.functions.clipboard")

if pcall(require, "lazyvim") then
  vim.notify("Using LazyVim plugins")
end
