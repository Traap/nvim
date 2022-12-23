-- {{{ Leader and maplocal

local keymap = require('traap.core.functions').keymap

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Easy align

vim.cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar>     gaip*<bar>
  nmap <leader>0 gaip*,
  nmap <leader>1 gaip=,
  nmap <leader>2 gaip=<space>
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings.

-- Delete the current line.
keymap('n', '-', 'dd')

-- Select (charwise) the contents of the current line, excluding indentation.
keymap('n', 'vv', '^vg_')

-- Select entire buffer
keymap('n', 'vaa', 'ggvGg_')
keymap('n', 'Vaa', 'ggVG')
keymap('n', '<leader>V', "V`]")

-- Save all files.
keymap('n', '<F2>', '<cmd>wall<cr>')

-- Delete current buffer.
keymap('n', 'Q', '<cmd>Bdelete!<cr>')

-- Toggle [in]visible characters.
keymap('n', '<leader>i', '<cmd>set list!<cr>')

-- Stay in indent mode.
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Visual yank
keymap('v', '<leader>cc', '"+y')

-- Obfuscate
keymap('n', '<f3>', 'mmggg?G`m')

-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap('n', 'zv', 'zMzvzz')

-- Close current fold when open. Always open next fold.
keymap('n', 'zj', 'zcjzOzz')

-- Close current fold when open. Always open previous fold.
keymap('n', 'zk', 'zckzOzz')

-- Keep the cursor in place while joining lines.
keymap('n', 'J', "mzJ`z")
keymap('n', '<leader>J', "myvipJ`ygq<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of test as a shell command.
keymap('n', '<localleader>E', [[0mMvg_"ky :exec "r!" getreg("k")<cr>]])
keymap('v', '<localleader>E', [["ky :exec "r!" getreg("k")<cr>]])

-- ------------------------------------------------------------------------- }}}
-- -- {{{ Control keys

keymap('n', '<c-g>', '<cmd>cd $GITHOME<cr>')
keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<c-q>', '<cmd>qall!<cr>')
keymap('n', '<c-s>', '<cmd>set filetype=sxhkd<cr>')

-- ------------------------------------------------------------------------- }}}
