-- {{{ Auto install packer.nvim if when needed.

-- Set installation path and clone url.
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local url = 'https://github.com/wbthomason/packer.nvim'

-- Clone packer if necessary.
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer.')
  vim.fn.system({'git', 'clone', '--depth', '1', url, install_path})
  vim.g.nvim_bootstrapped = 1

  -- Add packer.
  vim.cmd [[packadd packer.nvim]]
else
  vim.g.nvim_bootstrapped = 0
end


-- Auto compile when there are changes in plugins.lua
vim.cmd [[
  augroup PackerConfig
    autocmd!
    autocmd BufWritePost /home/traap/git/nvim/lua/traap/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

-- ------------------------------------------------------------------------- }}}
