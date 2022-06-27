-- {{{ Alias To vim APis.

local keymap = require('traap.utility.helpers').keymap

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Items I have dont' know how to move to which-key.

-- Easy align

vim.cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar>     gaip*<bar>
  nmap <leader>0 gaip*,
  nmap <leader>1 gaip=,
]])

-- Quit now

keymap('n', '<c-q>', '<cmd>qall!<cr>')

-- Delete the current line.
keymap('n', '-', 'dd')

-- ------------------------------------------------------------------------- }}}
