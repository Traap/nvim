vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]
vim.lsp.set_log_level("debug")

require("config.bootstrap")
require("config.clipboard")
require("config.customize")
require("config.functions")
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")
