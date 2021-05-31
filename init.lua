-- Standard Paths

local stdpath = vim.fn.stdpath
   CACHE_PATH = stdpath('cache')
  CONFIG_PATH = stdpath('config')
    DATA_PATH = stdpath('data')

-- Let show begin. 

require 'bootstrap'
require('plugins')
require('config')
-- require('lsp')
