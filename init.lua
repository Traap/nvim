vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

require("config.bootstrap")
require("config.lazy")

-- Setup debuggers that do not have nvim-dap plugins.
require("dbg")
