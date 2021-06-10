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
-- {{{ Keybindings

-- Stop search highlights.
map('n', '<leader><space>', '<cmd>noh<CR>')

-- Find files using Telescope command-line suggar.
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>mf', '<cmd>Telescope media_files<cr>')


-- Buffer resize
map('n', '<a-H>', '<cmd>vertical resize -1<cr>')
map('n', '<a-J>', '<cmd>resize +1<cr>')
map('n', '<a-K>', '<cmd>resize -1<cr>')
map('n', '<a-L>', '<cmd>vertical resize +1<cr>')

-- Copy and Paste
map('n', '<leader>cc', 'ggVGg_"+y')
map('v', '<leader>cc', '"+y')
map('n', '<leader>cv', '"+p')

-- Make only the current buffer visible.
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

-- Window movement without Tmux-Navigator
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- Clean trailing whitespaces
map('n', '<leader>wr', '<cmd>%s/\r//g<cr>')
map('n', '<leader>ws', "mz<cmd>%s//\\s\\+$//<cr><cmd>let @/=''<cr>`z")

-- KJV verse lookup.
map('n', 'gk', [[0mMvg_"ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
map('v', 'gs', 'S*v)3>')

-- Fugitive
map('n', '<Leader>gc', '<cmd>G commit<CR>')
map('n', '<Leader>gd', '<cmd>G diff<CR>')
map('n', '<Leader>gh', '<cmd>silent vert bo help fugitive<cr>')
map('n', '<Leader>gl', '<cmd>G log<CR>')
map('n', '<Leader>gP', '<cmd>G pull<CR>')
map('n', '<Leader>gp', '<cmd>G push<CR>')
map('n', '<Leader>gs', '<cmd>G<CR>')

-- <Tab> to navigate the completion menu
map('n', '<S-Tab>', 'pumvisible() ? [[\\<C-p>" : "\\<Tab>"', {expr = true})
map('n', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',  {expr = true})

-- nvim-tree
map('n', '<c-n>',       '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>nr',  '<cmd>NvimTreeRefresh<cr>')
map('n', '<leader>nf',  '<cmd>NvimTreeFindFile<cr>')

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
  ['<BS>']   = tree_cb('close_node'),
  ['<CR>']   = tree_cb('edit'),
  ['D']      = tree_cb('remove'),
  ['s']      = tree_cb('split'),
  ['v']      = tree_cb('vplit'),
  ['q']      = tree_cb('close'),
}

-- wiki.vim
map('n', '<leader>fw', '<cmd>WikiFzfPages<cr>')

-- Easy align
vim.cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nmap <bar> gaip*<bar>
]])

 -------------------------------------------------------------------------  }}}
