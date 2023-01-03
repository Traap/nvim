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

keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<c-q>', '<cmd>qall!<cr>')

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
-- {{{ L - LSP

keymap('n', '<leader>LF', '<cmd>LspToggleAutoFormat<cr>')
keymap('n', '<leader>LH', '<cmd>IlluminationToggle<cr>')
keymap('n', '<leader>LI', '<cmd>LspInstallInfo<cr>')
keymap('n', '<leader>LR', '<cmd>TroubleToggle lsp_references<cr>')
keymap('n', '<leader>LS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
keymap('n', '<leader>La', '<cmd>lua vim.lsp.buf.code_action()<cr>')
keymap('n', '<leader>Lc', '<cmd>lua require("traap.lsp").server_capabilities()<cr>')
keymap('n', '<leader>Ld', '<cmd>TroubleToggle<cr>')
keymap('n', '<leader>Lf', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
keymap('n', '<leader>Lh', "<cmd>lua require('lsp-inlayhints').toggle()<cr>")
keymap('n', '<leader>Li', '<cmd>LspInfo<cr>')
keymap('n', '<leader>Lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})cr>')
keymap('n', '<leader>Lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})cr>')
keymap('n', '<leader>Ll', '<cmd>lua vim.lsp.codelens.run()<cr>')
keymap('n', '<leader>Lo', '<cmd>SymbolsOutline<cr>')
keymap('n', '<leader>Lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>')
keymap('n', '<leader>Lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
keymap('n', '<leader>Ls', '<cmd>Telescope lsp_document_symbols<cr>')
keymap('n', '<leader>Lt', '<cmd>lua require("user.functions").toggle_diagnostics()<cr>')
keymap('n', '<leader>Lu', '<cmd>LuaSnipUnlinkCurrent<cr>')
keymap('n', '<leader>Lv', '<cmd>lua require("lsp_lines").toggle()<cr>')
keymap('n', '<leader>Lw', '<cmd>Telescope lsp_workspace_diagnostics<cr>')

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
keymap('n', '<leader>fp', '<cmd>find_files cwd=~/.local/share/nvim/site/pack/packer<cr>')
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

keymap('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>')
keymap('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

keymap('n', '<leader>oh', '<cmd>chechhealth<cr>')
keymap('n', '<leader>oo', '<cmd>only<cr>')
keymap('n', '<leader>or', [[<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ p - Packer

keymap('n', '<leader>pS', '<cmd>PackerStatus<cr>')
keymap('n', '<leader>pc', '<cmd>PackerCompile<cr>')
keymap('n', '<leader>pi', '<cmd>PackerInstall<cr>')
keymap('n', '<leader>ps', '<cmd>PackerSync<cr>')
keymap('n', '<leader>pu', '<cmd>PackerUpdate<cr>')

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
keymap('n', '<leader>wi', '<cmd>edit /home/traap/git/wiki/index.md<cr>')
keymap('n', '<leader>wp', '<cmd>WikiFzfPages<cr>')
keymap('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
keymap('n', '<leader>ww', [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]])
keymap('n', '<leader>wZ', '<cmd>WikiFzfTags<cr>')
keymap('n', '<leader>wv', '<cmd><cr>')
keymap('n', '<leader>wz', "<cmd>execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &<cr>")

-- ------------------------------------------------------------------------- }}}
