-- {{{ Alias To vim APis.

local keymap = require('traap.utility').keymap

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

-- Move to $GITHOME
keymap('n', '<c-g>', '<cmd>cd $GITHOME<cr>')

-- Quit now
keymap('n', '<c-q>', '<cmd>qall!<cr>')

-- sxhkd filetype.
keymap('n', '<c-s>', '<cmd>set filetype=sxhkd<cr>')

-- Delete the current line.
keymap('n', '-', 'dd')

-- Toggle NvimTree
keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')

-- Visual yank
keymap('v', '<leader>cc', '"+y')

-- Select (charwise) the contents of the current line, excluding indentation.
keymap('n', 'vv', '^vg_')

-- Select entire buffer
keymap('n', 'vaa', 'ggvGg_')
keymap('n', 'Vaa', 'ggVG')
keymap('n', '<leader>V', "V`]")

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

-- Keep the cursor in place while joining lines.
keymap('n', 'J', "mzJ`z")
keymap('n', '<leader>J', "myvipJ`ygq<cr>")

-- Toggle [in]visible characters.
keymap('n', '<leader>i', '<cmd>set list!<cr>')

-- ------------------------------------------------------------------------- }}}
