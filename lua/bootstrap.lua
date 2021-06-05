-- {{{ Auto install packer.nvim if not exists

local     cmd = vim.cmd
local execute = vim.api.nvim_command
local      fn = vim.fn
local       g = vim.g

-- Install packer when needed.
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
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
