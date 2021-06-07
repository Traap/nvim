-- {{{ Auto install packer.nvim if when needed.

local     cmd = vim.cmd
local execute = vim.api.nvim_command
local      fn = vim.fn
local       g = vim.g

-- Set installation path and clone url.
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local url = 'https://github.com/wbthomason/packer.nvim'

-- Clone packer if necessary.
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system('git', 'clone', url, install_path)
  execute 'packadd packer.nvim'
  g.nvim_bootstrapped = 1
else
  g.nvim_bootstrapped = 0
end

-- Add packer.
cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- ------------------------------------------------------------------------- }}}
