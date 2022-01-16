-- {{{ Alias to vim APis.

local      g = vim.g
local    cmd = vim.cmd
local      u = require'traap.utility.helpers'

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

     g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer resize

u.keymap('n', '<leader>h', '<cmd>vertical resize -1<cr>')
u.keymap('n', '<leader>j', '<cmd>resize +1<cr>')
u.keymap('n', '<leader>k', '<cmd>resize -1<cr>')
u.keymap('n', '<leader>l', '<cmd>vertical resize +1<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer selection

-- Make only the current buffer visible.

u.keymap('n', '<leader>oo', '<cmd>only<cr>')

-- Delete the current line.
u.keymap('n', '-', 'dd')

-- Select (charwise) the contents of the current line, excluding indentation.
u.keymap('n', 'vv', '^vg_')

-- Select the entire buffer.
u.keymap('n', 'vaa', 'ggvGg_')
u.keymap('n', 'Vaa', 'ggvG')

-- Linewise reslection of what you just pasted.
u.keymap('n', '<leader>V', 'V`')

-- ------------------------------------------------------------------------- }}}
-- {{{ Check Health

u.keymap('n', '<leader>ch', '<cmd>checkhealth<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Clean trailing whitespaces

u.keymap('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
u.keymap('n', '<leader>ws', "mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z")

-- ------------------------------------------------------------------------- }}}
-- {{{ Copy and Paste

u.keymap('n', '<leader>cc', 'ggVGg_"+y')
u.keymap('v', '<leader>cc', '"+y')
u.keymap('n', '<leader>cv', '"+p')

-- ------------------------------------------------------------------------- }}}
-- {{{ Easy align

cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar>     gaip*<bar>
  nmap <leader>0 gaip*,
]])

 -------------------------------------------------------------------------  }}}
-- {{{ Find files using Telescope command-line suggar.

u.keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
u.keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
u.keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
u.keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
u.keymap('n', '<leader>fn', '<cmd>Telescope find_files cwd=~/git/nvim<cr>')
u.keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
u.keymap('n', '<leader>fp', '<cmd>Telescope find_files cwd=~/.local/share/nvim/site/pack/packer<cr>')
u.keymap('n', '<leader>fv', '<cmd>Telescope find_files cwd=~/git/vim<cr>')
u.keymap('n', '<leader>mf', '<cmd>Telescope media_files<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Fold navigation
--
-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
u.keymap('n', 'zv', 'zMzvzz')

-- Close current fold when open. Always open next fold.
u.keymap('n', 'zj', 'zcjzOzz')

-- Close current fold when open. Always open previous fold.
u.keymap('n', 'zk', 'zckzOzz')

-- ------------------------------------------------------------------------- }}}
-- {{{ Fugitive

u.keymap('n', '<Leader>gc', '<cmd>G commit<CR>')
u.keymap('n', '<Leader>gd', '<cmd>G diff<CR>')
u.keymap('n', '<Leader>gh', '<cmd>silent vert bo help fugitive<cr>')
u.keymap('n', '<Leader>gl', '<cmd>G log<CR>')
u.keymap('n', '<Leader>gP', '<cmd>G pull<CR>')
u.keymap('n', '<Leader>gp', '<cmd>G push<CR>')
u.keymap('n', '<Leader>gs', '<cmd>G<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ KJV verse lookup.

u.keymap('n', 'gk', [[0mMvg_"ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
u.keymap('n', 'gt', 'v)3>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua File.

u.keymap('n', '<Leader>lf', [[<cmd>w<cr><cmd>luafile %<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Plant UML

u.keymap('n', '<leader>gu', '<cmd>call GenerateUmlDiagram()<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Quit now

u.keymap('n', '<c-q>', '<cmd>qall!<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Stop search highlights.

u.keymap('n', '<leader><space>', '<cmd>noh<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

u.keymap('n', '<leader>rr',  '<cmd>VtrResizeRunner<cr>')
u.keymap('n', '<leader>ror', '<cmd>VtrReorientRunner<cr>')
u.keymap('n', '<leader>sc',  '<cmd>VtrSendCommandToRunner<cr>')
u.keymap('n', '<leader>sf',  '<cmd>VtrSendFile!<cr>')
u.keymap('n', '<leader>sl',  '<cmd>VtrSendLinesToRunner<cr>')
u.keymap('n', '<leader>or',  "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>")
u.keymap('n', '<leader>kr',  '<cmd>VtrKillRunner<cr>')
u.keymap('n', '<leader>fr',  '<cmd>VtrFocusRunner<cr>')
u.keymap('n', '<leader>dr',  '<cmd>VtrDetachRunner<cr>')
u.keymap('n', '<leader>ar',  '<cmd>VtrReattachRunner<cr>')
u.keymap('n', '<leader>cr',  '<cmd>VtrClearRunner<cr>')
u.keymap('n', '<leader>fc',  '<cmd>VtrFlushCommand<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ <Tab> to navigate the completion menu

u.keymap('n', '<S-Tab>', 'pumvisible() ? [[\\<C-p>" : "\\<Tab>"', {expr = true})
u.keymap('n', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',  {expr = true})

-- ------------------------------------------------------------------------- }}}
-- {{{ wiki.vim

u.keymap('n', '<leader>fw', '<cmd>WikiFzfPages<cr>')
u.keymap('n', '<leader>we', '<cmd>WikiExport<cr>')
u.keymap('n', '<leader>wv', "<cmd>execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &<cr>")
u.keymap('n', '<leader>il', 'y$v$<cr><cr>p0ys$_<cr><cr>')

-- ------------------------------------------------------------------------- }}}
