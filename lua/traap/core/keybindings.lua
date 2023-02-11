-- {{{ Leader and maplocal

local keymap = require('traap.core.functions').keymap

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

-- Alternative ESC key to avoid <Ctrl-[>.  Useful when a RCP is used to connect
-- to a remote host.
keymap('i', ';;', '<esc>')
keymap('c', ';;', '<esc>')

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

-- ------------------------------------------------------------------------- }}}
-- {{{ Keep the cursor in place while joining lines.

keymap('n', 'J', "mzJ`z")
keymap('n', '<leader>J', "myvipJ`ygq<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of test as a shell command.
keymap('n', '<localleader>E', [[0mMvg_"ky :exec "r!" getreg("k")<cr>]])
keymap('v', '<localleader>E', [["ky :exec "r!" getreg("k")<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Quit all

keymap('n', '<c-q>', '<cmd>qall!<cr>')
keymap('n', '<leader>qq', '<cmd>qall!<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

keymap('n', '<leader><space>', '<cmd>nohlsearch<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ G - Gist

keymap('n', '<leader>Ga', '<cmd>Gist -b -a<cr>')
keymap('n', '<leader>Gd', '<cmd>Gist -d<cr>')
keymap('n', '<leader>Gf', '<cmd>Gist -f<cr>')
keymap('n', '<leader>Gg', '<cmd>Gist -b<cr>')
keymap('n', '<leader>Gl', '<cmd>Gist -l<cr>')
keymap('n', '<leader>Gp', '<cmd>Gist -b -p<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

keymap('n', '<leader>HH', '<cmd>silent vert bo help<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ V - Linewise reselection of what you just pasted.

keymap('n', '<leader>VV', "V`]")

-- ------------------------------------------------------------------------- }}}
-- {{{ S - Gitsigns

keymap('n', '<leader>SR', '<cmd>lua require "gitsigns".reset_hunk()<cr>')
keymap('n', '<leader>SS', '<cmd>lua require "gitsigns".stage_hunk()<cr>')
keymap('n', '<leader>Sd', '<cmd>Gitsigns diffthis HEAD<cr>')
keymap('n', '<leader>Sh', '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>')
keymap('n', '<leader>Sj', '<cmd>lua require "gitsigns".next_hunk()<cr>')
keymap('n', '<leader>Sk', '<cmd>lua require "gitsigns".prev_hunk()<cr>')
keymap('n', '<leader>Sp', '<cmd>lua require "gitsigns".preview_hunk()<cr>')
keymap('n', '<leader>Sr', '<cmd>lua require "gitsigns".reset_buffer()<cr><cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ a - avaiable

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

keymap('n', '<leader>bh', '<cmd>vertical resize -1<cr>')
keymap('n', '<leader>bj', '<cmd>resize +1<cr>')
keymap('n', '<leader>bk', '<cmd>resize -1<cr>')
keymap('n', '<leader>bl', '<cmd>vertical resize +1<cr>')
keymap('n', '<leader>bx', [[<cmd>w<cr><cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Copy & Paste

keymap('n', '<leader>cc', 'ggVGg_"+y')
keymap('n', '<leader>cr', '<cmd>VtrClearRunner<cr>')
keymap('n', '<leader>cv', '"+p')

-- ------------------------------------------------------------------------- }}}
-- {{{ d - Debug Adapter Protocol (DAP).

keymap('n', '<leader>dC', [[<cmd>lua require'dap'.run_to_cursor()<cr>]])
keymap('n', '<leader>db', [[<cmd>lua require'dap'.step_back()<cr>]])
keymap('n', '<leader>dc', [[<cmd>lua require'dap'.continue()<cr>]])
keymap('n', '<leader>dd', [[<cmd>lua require'dap'.disconnect()<cr>]])
keymap('n', '<leader>dg', [[<cmd>lua require'dap'.session()<cr>]])
keymap('n', '<leader>di', [[<cmd>lua require'dap'.step_into()<cr>]])
keymap('n', '<leader>dl', [[<cmd>lua require'dap'.open_logfile()<cr>]])
keymap('n', '<leader>do', [[<cmd>lua require'dap'.step_over()<cr>]])
keymap('n', '<leader>dp', [[<cmd>lua require'dap'.pause()<cr>]])
keymap('n', '<leader>dq', [[<cmd>lua require'dap'.close()<cr>]])
keymap('n', '<leader>dr', [[<cmd>lua require'dap'.repl.toggle()<cr>]])
keymap('n', '<leader>ds', [[<cmd>lua require'dap'.continue()<cr>]])
keymap('n', '<leader>dt', [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]])
keymap('n', '<leader>du', [[<cmd>lua require'dap'.step_out()<cr>]])

-- Mimic Microsoft Visual Code / Studio products.
keymap('n', '<F5>',  [[<cmd>lua require'dap'.continue()<cr>]])
keymap('n', '<F10>', [[<cmd>lua require'dap'.step_over()<cr>]])
keymap('n', '<F11>', [[<cmd>lua require'dap'.step_into()<cr>]])
keymap('n', '<F12>', [[<cmd>lua require'dap'.step_out()<cr>]])

-- DAPUI
keymap('n', '<leader>dU', [[<cmd>lua require'dapui'.toggle()<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find

keymap('n', '<leader>fC', '<cmd>Telescope commands<cr>')
keymap('n', '<leader>fF', '<cmd>Telescope media_files<cr>')
keymap('n', '<leader>fM', '<cmd>Telescope man_pages<cr>')
keymap('n', '<leader>fO', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<leader>fR', '<cmd>Telescope registers<cr>')
keymap('n', '<leader>fS', '<cmd>Telescope colorscheme<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fc', '<cmd>VtrFlushCommand<cr>')
keymap('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap('n', '<leader>fi', "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>")
keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
keymap('n', '<leader>fl', '<cmd>Telescope resume<cr>')
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<leader>fr', '<cmd>VtrFocusRunner<cr>')
keymap('n', '<leader>fw', '<cmd>Telescope grep_string<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

keymap('n', '<leader>gC', '<cmd>Telescope git_commits<cr>')
keymap('n', '<leader>gP', '<cmd>G pull<cr>')
keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
keymap('n', '<leader>gc', '<cmd>G commmit<cr>')
keymap('n', '<leader>gd', '<cmd>G diff<cr>')
keymap('n', '<leader>gh', '<cmd>vert bo help fugitive<cr>')
keymap('n', '<leader>gl', '<cmd>G log<cr>')
keymap('n', '<leader>go', '<cmd>Telescope git_status<cr>')
keymap('n', '<leader>gp', '<cmd>G push<cr>')
keymap('n', '<leader>gs', '<cmd>G<cr>')
keymap('n', '<leader>gu', '<cmd>call GenerateUmlDiagram<cr>')

keymap('n', 'gk',         [[0mMvg_"ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
keymap('v', 'gk',         [["ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

--  k = {[[0mMvg_"ky :exec "r!kjv -b -w 65 -d" getreg("k")<cr>]], "Get KJV verse" },
--  k = {[["ky :exec "r!kjv -b -w 65 -d" getreg("k")<cr>]], "Get KJV verse" },

-- ------------------------------------------------------------------------- }}}
-- {{{ k - kill runner

keymap('n', '<leader>kr', '<cmd>VtrKillRunner<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ l - VimTex

keymap('n', '<leader>lC', '<Plug>(vimtex-clean-full)')
keymap('n', '<leader>lG', '<Plug>(vimtex-status-all)')
keymap('n', '<leader>lI', '<Plug>(vimtex-info-full)')
keymap('n', '<leader>lK', '<Plug>(vimtex-stop-all)')
keymap('n', '<leader>lL', '<Plug>(vimtex-compile-selected)')
keymap('n', '<leader>lT', '<Plug>(vimtex-toc-toggle)')
keymap('n', '<leader>lX', '<Plug>(vimtex-reload-state)')
keymap('n', '<leader>la', '<Plug>(vimtex-context-menu)')
keymap('n', '<leader>lc', '<Plug>(vimtex-clean-full)')
keymap('n', '<leader>le', '<Plug>(vimtex-error)')
keymap('n', '<leader>lg', '<Plug>(vimtex-status)')
keymap('n', '<leader>li', '<Plug>(vimtex-info)')
keymap('n', '<leader>lk', '<Plug>(vimtex-stop)')
keymap('n', '<leader>ll', '<Plug>(vimtex-compile)')
keymap('n', '<leader>lm', '<Plug>(vimtex-impas-list)')
keymap('n', '<leader>lo', '<Plug>(vimtex-compile-output)')
keymap('n', '<leader>lq', '<Plug>(vimtex-log)')
keymap('n', '<leader>ls', '<Plug>(vimtex-toggle-main)')
keymap('n', '<leader>lt', '<Plug>(vimtex-toc_open)')
keymap('n', '<leader>lv', '<Plug>(vimtex-view)')
keymap('n', '<leader>lx', '<Plug>(vimtex-reload)')

-- ------------------------------------------------------------------------- }}}
-- {{{ n - NvimTree

if require('traap.core.customize').neo_tree_nvim or
   require('traap.core.customize').nvim_tree then

   -- nvim_tree takes precedence when both are true.
   if require('traap.core.customize').nvim_tree then
    keymap('n', '<c-n>',      '<cmd>NvimTreeToggle<cr>')
    keymap('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>')
    keymap('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>')
  else
    keymap('n', '<c-n>',      '<cmd>Neotree toggle<cr>')
    keymap('n', '<leader>nf', '<cmd>Neotree focus<cr>')
    keymap('n', '<leader>nr', '<cmd>Neotree show<cr>')
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

keymap('n', '<leader>oh', '<cmd>checkhealth<cr>')
keymap('n', '<leader>oo', '<cmd>only<cr>')
keymap('n', '<leader>or', [[<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ p - Packer

keymap('n', '<leader>ph', '<cmd>Lazy home<cr>')
keymap('n', '<leader>pl', '<cmd>Lazy log<cr>')
keymap('n', '<leader>pp', '<cmd>Lazy profile<cr>')
keymap('n', '<leader>ps', '<cmd>Lazy sync<cr>')
keymap('n', '<leader>pu', '<cmd>Lazy update<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ r - Repace

keymap('n', '<leader>rR', 'ReorientRunner<cr>')
keymap('n', '<leader>ra', [[ggdG<cmd>exec 'r!rake build:amber'<cr>]])
keymap('n', '<leader>rp', [[ggdG<cmd>exec 'r!rubocop'<cr>]])
keymap('n', '<leader>rr', '<cmd>VtrResizeRunner<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts


keymap('n', '<leader>sc', '<cmd>VtrSendCommandToRunner<cr>')
keymap('n', '<leader>sf', '<cmd>VtrSendCommandToRunner<cr>')
keymap('n', '<leader>sl', '<cmd>VtrSendLinesToRunner<cr>')
keymap('n', '<leader>sh', '<cmd>split<cr>')
keymap('n', '<leader>sv', '<cmd>vsplit<cr>')
keymap('n', '<leader>ss', '0v)k$:sort<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ t - Tmux

keymap('n', '<leader>tF', '<cmd>VtrFocusRunner<cr>')
keymap('n', '<leader>tO', '<cmd>VtrReorientRunner<cr>')
keymap('n', '<leader>tR', '<cmd>VtrSendFile!<cr>')
keymap('n', '<leader>tS', '<cmd><cr>')
keymap('n', '<leader>ta', '<cmd>VtrReattachRunner<cr>')
keymap('n', '<leader>tc', '<cmd>VtrClearRunner<cr>')
keymap('n', '<leader>tf', '<cmd>VtrFlushCommand<cr>')
keymap('n', '<leader>tk', '<cmd>VtrKillRunner<cr>')
keymap('n', '<leader>tl', '<cmd>VtrSendLinesToRunner<<cr>')
keymap('n', '<leader>to', '<cmd>VtrOpenRunner<cr>')
keymap('n', '<leader>ts', '<cmd>VtrSendCommandToRunner<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Wiki &  Whitespace

keymap('n', '<leader>wa', '<cmd>edit /home/traap/git/wiki/journal/Acronyms.md<cr>')
keymap('n', '<leader>wb', '<cmd>edit /home/traap/git/wiki/journal/Backlog.md<cr>')
keymap('n', '<leader>we', '<cmd>WikiExport<cr>')
keymap('n', '<leader>wi', '<cmd>WikiIndex<cr>')
keymap('n', '<leader>wp', '<cmd>WikiFzfPages<cr>')
keymap('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
keymap('n', '<leader>ww', [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]])
keymap('n', '<leader>wZ', '<cmd>WikiFzfTags<cr>')
keymap('n', '<leader>wv', '<cmd><cr>')
keymap('n', '<leader>wz', "<cmd>execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &<cr>")

-- ------------------------------------------------------------------------- }}}
