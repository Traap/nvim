-- {{{ Alias To vim APis.

local keymap = require('traap.utility.helpers').keymap

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer resize

keymap('n', '<leader>h', '<cmd>vertical resize -1<cr>')
keymap('n', '<leader>j', '<cmd>resize +1<cr>')
keymap('n', '<leader>k', '<cmd>resize -1<cr>')
keymap('n', '<leader>l', '<cmd>vertical resize +1<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer selection

-- Make only the current buffer visible.

keymap('n', '<leader>oo', '<cmd>only<cr>')

-- Delete the current line.
keymap('n', '-', 'dd')

-- Select (charwise) the contents of the current line, excluding indentation.
keymap('n', 'vv', '^vg_')

-- Select the entire buffer.
keymap('n', 'vaa', 'ggvGg_')
keymap('n', 'Vaa', 'ggvG')

-- Linewise reslection of what you just pasted.
keymap('n', '<leader>V', 'V`')

-- ------------------------------------------------------------------------- }}}
-- {{{ Check Health

keymap('n', '<leader>ch', '<cmd>checkhealth<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Clean trailing whitespaces

keymap('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
keymap('n', '<leader>ws', "mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z")

-- ------------------------------------------------------------------------- }}}
-- {{{ Copy and Paste

keymap('n', '<leader>cc', 'ggVGg_"+y')
keymap('v', '<leader>cc', '"+y')
keymap('n', '<leader>cv', '"+p')

-- ------------------------------------------------------------------------- }}}
-- {{{ Display help in vertical buffer.

keymap('n', '<leader>HH', '<cmd>silent vert bo help<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Easy align

vim.cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar>     gaip*<bar>
  nmap <leader>0 gaip*,
  nmap <leader>1 gaip=,
]])

 -------------------------------------------------------------------------  }}}
-- {{{ Find files using Telescope command-line suggar.

keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap('n', '<leader>fn', '<cmd>Telescope find_files cwd=~/git/nvim<cr>')
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<leader>fp', '<cmd>Telescope find_files cwd=~/.local/share/nvim/site/pack/packer<cr>')
keymap('n', '<leader>fv', '<cmd>Telescope find_files cwd=~/git/vim<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>ld', '<cmd>Telescope diagnostics<cr>')
keymap('n', '<leader>mf', '<cmd>Telescope media_files<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Fold navigation
--
-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap('n', 'zv', 'zMzvzz')

-- Close current fold when open. Always open next fold.
keymap('n', 'zj', 'zcjzOzz')

-- Close current fold when open. Always open previous fold.
keymap('n', 'zk', 'zckzOzz')

-- ------------------------------------------------------------------------- }}}
-- {{{ Fugitive

keymap('n', '<Leader>gc', '<cmd>G commit<CR>')
keymap('n', '<Leader>gd', '<cmd>G diff<CR>')
keymap('n', '<Leader>gh', '<cmd>silent vert bo help fugitive<cr>')
keymap('n', '<Leader>gl', '<cmd>G log<CR>')
keymap('n', '<Leader>gP', '<cmd>G pull<CR>')
keymap('n', '<Leader>gp', '<cmd>G push<CR>')
keymap('n', '<Leader>gs', '<cmd>G<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ KJV verse lookup.

keymap('n', 'gk', [[^"kyg$<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
keymap('n', 'gt', 'v)3>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua File.

keymap('n', '<leader><leader>l', [[<cmd>w<cr><cmd>luafile %<cr>]])
keymap('n', '<leader><leader>s', [[<cmd>luafile $MYVIMRC<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ nvim-tree

keymap('n', '<c-n>',       '<cmd>NvimTreeToggle<cr>')
keymap('n', '<leader>nr',  '<cmd>NvimTreeRefresh<cr>')
keymap('n', '<leader>nf',  '<cmd>NvimTreeFindFile<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Plant UML

keymap('n', '<leader>gu', '<cmd>call GenerateUmlDiagram()<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Quit now

keymap('n', '<c-q>', '<cmd>qall!<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Stop search highlights.

keymap('n', '<leader><space>', '<cmd>noh<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux Runner

keymap('n', '<leader>rr',  '<cmd>VtrResizeRunner<cr>')
keymap('n', '<leader>ror', '<cmd>VtrReorientRunner<cr>')
keymap('n', '<leader>sc',  '<cmd>VtrSendCommandToRunner<cr>')
keymap('n', '<leader>sf',  '<cmd>VtrSendFile!<cr>')
keymap('n', '<leader>sl',  '<cmd>VtrSendLinesToRunner<cr>')
keymap('n', '<leader>or',  "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>")
keymap('n', '<leader>kr',  '<cmd>VtrKillRunner<cr>')
keymap('n', '<leader>fr',  '<cmd>VtrFocusRunner<cr>')
keymap('n', '<leader>dr',  '<cmd>VtrDetachRunner<cr>')
keymap('n', '<leader>ar',  '<cmd>VtrReattachRunner<cr>')
keymap('n', '<leader>cr',  '<cmd>VtrClearRunner<cr>')
keymap('n', '<leader>fc',  '<cmd>VtrFlushCommand<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux Sessions

-- Below are the tmux sessions I create and kill frequently.

keymap('n', '<leader>tao',   '<cmd>Dispatch!ao ao<cr>')
keymap('n', '<leader>tbash', '<cmd>Dispatch!ao bash<cr>')
keymap('n', '<leader>tkjv',  '<cmd>Dispatch!ao kjv<cr>')
keymap('n', '<leader>tssh',  '<cmd>Dispatch!ao ssh<cr>')
keymap('n', '<leader>tsoup', '<cmd>Dispatch!ao soup<cr>')
keymap('n', '<leader>tvim',  '<cmd>Dispatch!ao vim<cr>')
keymap('n', '<leader>twiki', '<cmd>Dispatch!ao wiki<cr>')

keymap('n', '<leader>kao',   '<cmd>Dispatch!tmux kill-session -t ao<cr>')
keymap('n', '<leader>kbash', '<cmd>Dispatch!tmux kill-session -t bash<cr>')
keymap('n', '<leader>kkjv',  '<cmd>Dispatch!tmux kill-session -t kjv<cr>')
keymap('n', '<leader>kssh',  '<cmd>Dispatch!tmux kill-session -t ssh<cr>')
keymap('n', '<leader>ksoup', '<cmd>Dispatch!tmux kill-session -t soup<cr>')
keymap('n', '<leader>kvim',  '<cmd>Dispatch!tmux kill-session -t vim<cr>')
keymap('n', '<leader>kwiki', '<cmd>Dispatch!tmux kill-session -t wiki<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ <Tab> to navigate the completion menu

keymap('n', '<S-Tab>', 'pumvisible() ? [[\\<C-p>" : "\\<Tab>"', {expr = true})
keymap('n', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',  {expr = true})

-- ------------------------------------------------------------------------- }}}
-- {{{ wiki.vim

keymap('n', '<leader>wa', "<cmd>edit /home/traap/git/wiki/journal/Acronyms.md<cr>")
keymap('n', '<leader>wb', "<cmd>edit /home/traap/git/wiki/journal/Backlog.md<cr>")
keymap('n', '<leader>fw', '<cmd>WikiFzfPages<cr>')
keymap('n', '<leader>we', '<cmd>WikiExport<cr>')
keymap('n', '<leader>wv', "<cmd>execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &<cr>")
keymap('n', '<leader>il', "v$<cr><cr><cr>")

-- ------------------------------------------------------------------------- }}}
