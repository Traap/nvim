-- {{{ Alias To vim APis.

local keymap = require('traap.utility.helpers').keymap

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[\]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Items I have not successfully moved into which-key.

-- Easy align

vim.cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar>     gaip*<bar>
  nmap <leader>0 gaip*,
  nmap <leader>1 gaip=,
  nmap <leader>2 gaip=<space>
]])

-- Quit now
keymap('n', '<c-q>', '<cmd>qall!<cr>')

-- Delete the current line.
keymap('n', '-', 'dd')

-- Toggle NvimTree
keymap('n', '<c-n>','<cmd>NvimTreeToggle<cr>')

-- Visual yank
keymap('v', '<leader>cc', '"+y')

-- Select (charwise) the contents of the current line, excluding indentation.
keymap('n', 'vv', '^vg_')

-- Select entire buffer
keymap('n', 'vaa', 'ggvGg_')
keymap('n', 'Vaa', 'ggVG')

-- Save all files.
keymap('n', '<F2>', '<cmd>wall<cr>')

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap('n', 'zv', 'zMzvzz')

-- Close current fold when open. Always open next fold.
keymap('n', 'zj', 'zcjzOzz')

-- Close current fold when open. Always open previous fold.
keymap('n', 'zk', 'zckzOzz')

-- ------------------------------------------------------------------------- }}}
