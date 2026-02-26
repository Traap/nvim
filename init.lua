-- Take control of my leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.lazyvim_check_order = false

require("traap.core.notify")

-- Bootstrap using lazy.nvim package manager.
require("traap.config.bootstrap")

-- Personalize Lazy.nvim and Lazy.vim
require("traap.config.lazy")

-- Apply my customizations.
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.core.clipboard")

if not vim.g.vscode then
  vim.cmd.colorscheme(require("traap.config.colorscheme").name)
end
require("traap.core.working").from()
require("traap.core.working").whosePlugins()

-- {{{ HACK: stuff I experiment with before I modify plugins or core files.
-- esc fallbadk Omarchy -> vpn -> Reminna -> W11

vim.keymap.set("i", "jk", function()
  return vim.fn.pumvisible() == 1 and "jk" or "<Esc>"
end, { expr = true, noremap = true, silent = true })

-- ------------------------------------------------------------------------- }}}
