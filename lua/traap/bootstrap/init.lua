-- {{{ Auto install packer.nvim if when needed.

-- Set installation path and clone url.
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local url = 'https://github.com/wbthomason/packer.nvim'

-- Clone packer if necessary.
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer.')
  vim.fn.system({'git', 'clone', url, install_path})
  vim.g.nvim_bootstrapped = 1
else
  vim.g.nvim_bootstrapped = 0
end

-- Add packer.
vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd [[
  augroup PackerConfig
    autocmd!
    autocmd BufWritePost /home/traap/git/nvim/lua/traap/plugins/init.lua source <afile> | PackerCompile
  augroup end
]]

-- ------------------------------------------------------------------------- }}}
