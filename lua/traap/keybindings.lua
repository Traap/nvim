-- {{{ Alias to vim APis.

local      g = vim.g
local    api = vim.api
local    cmd = vim.cmd
local extend = vim.tbl_extend

-- ------------------------------------------------------------------------- }}}
-- {{{ keymap helper function.
--
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then options = extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

     g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer resize

map('n', '<leader>h', '<cmd>vertical resize -1<cr>')
map('n', '<leader>j', '<cmd>resize +1<cr>')
map('n', '<leader>k', '<cmd>resize -1<cr>')
map('n', '<leader>l', '<cmd>vertical resize +1<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer selection

-- BuMake only the current buffer visible.

map('n', '<leader>oo', '<cmd>only<cr>')

-- Delete the current line.
map('n', '-', 'dd')

-- Select (charwise) the contents of the current line, excluding indentation.
map('n', 'vv', '^vg_')

-- Select the entire buffer.
map('n', 'vaa', 'ggvGg_')
map('n', 'Vaa', 'ggvG')

-- Linewise reslection of what you just pasted.
map('n', '<leader>V', 'V`')

-- ------------------------------------------------------------------------- }}}
-- {{{ Check Health

map('n', '<leader>ch', '<cmd>checkhealth<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Clean trailing whitespaces

map('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
map('n', '<leader>ws', "mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z")

-- ------------------------------------------------------------------------- }}}
-- {{{ Copy and Paste

map('n', '<leader>cc', 'ggVGg_"+y')
map('v', '<leader>cc', '"+y')
map('n', '<leader>cv', '"+p')

-- ------------------------------------------------------------------------- }}}
-- {{{ Easy align

cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar> gaip*<bar>
]])

 -------------------------------------------------------------------------  }}}
-- {{{ Find files using Telescope command-line suggar.

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fn', '<cmd>Telescope find_files cwd=~/git/nvim<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fp', '<cmd>Telescope find_files cwd=~/.local/share/nvim/site/pack/packer<cr>')
map('n', '<leader>fv', '<cmd>Telescope find_files cwd=~/git/vim<cr>')
map('n', '<leader>mf', '<cmd>Telescope media_files<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Fugitive

map('n', '<Leader>gc', '<cmd>G commit<CR>')
map('n', '<Leader>gd', '<cmd>G diff<CR>')
map('n', '<Leader>gh', '<cmd>silent vert bo help fugitive<cr>')
map('n', '<Leader>gl', '<cmd>G log<CR>')
map('n', '<Leader>gP', '<cmd>G pull<CR>')
map('n', '<Leader>gp', '<cmd>G push<CR>')
map('n', '<Leader>gs', '<cmd>G<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ KJV verse lookup.

map('n', 'gk', [[0mMvg_"ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
map('n', 'gt', 'v)3>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua File.

map('n', '<Leader>lf', [[<cmd>w<cr><cmd>luafile %<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ nvim-tree

map('n', '<c-n>',       '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>nr',  '<cmd>NvimTreeRefresh<cr>')
map('n', '<leader>nf',  '<cmd>NvimTreeFindFile<cr>')

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-}>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = "<C-t>",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C->",                         cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "}c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Plant UML

map('n', '<leader>gu', '<cmd>call GenerateUmlDiagram()<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Quit now

map('n', '<c-q>', '<cmd>qall!<cr>')

-- ------------------------------------------------------------------------- }}}
-- {{{ Stop search highlights.

map('n', '<leader><space>', '<cmd>noh<CR>')

-- ------------------------------------------------------------------------- }}}
-- {{{ <Tab> to navigate the completion menu

map('n', '<S-Tab>', 'pumvisible() ? [[\\<C-p>" : "\\<Tab>"', {expr = true})
map('n', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',  {expr = true})

-- ------------------------------------------------------------------------- }}}
-- {{{ wiki.vim

map('n', '<leader>fw', '<cmd>WikiFzfPages<cr>')
map('n', '<leader>we', '<cmd>WikiExport<cr>')
-- map('n', '<leader>wv', '<cmd>execute '!'g:traap_pdf_viewer g:wiki_root . '/printed/' . expand('%:p:t:r') .'.pdf' . '&'<cr>)


-- ------------------------------------------------------------------------- }}}
-- {{{ Window movement without Tmux-Navigator

map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- ------------------------------------------------------------------------- }}}
