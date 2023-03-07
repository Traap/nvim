vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

require("config.bootstrap")
require("config.lazy")

-- Starting DAP experiments.
require("dbg")
