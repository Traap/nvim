-- {{{ Map leader to space

vim.g.mapleader = ' '

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim objecs.

local     cmd = vim.cmd
local execute = vim.api.nvim_command
local      fn = vim.fn
local stdpath = vim.fn.stdpath

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto install packer.nvim if not exists

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- ------------------------------------------------------------------------- }}}
-- {{{ Add in all required parts.

 CACHE_PATH = stdpath('cache')
CONFIG_PATH = stdpath('config')
  DATA_PATH = stdpath('data')

require('settings')
require('plugins')
require('keymappings')
require('lsp')
require('config')

-- -------------------------------------------------------------------------- }}}
