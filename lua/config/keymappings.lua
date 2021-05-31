-- {{{ Map leader to space

local g = vim.g
     g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Keybindings 

local utils = require('utils')
local   map = utils.map

-- Stop search highlights.
map('n', '<leader><space>', '<cmd>noh<CR>')

-- Find files using Telescope command-line suggar.
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')

-- nvim-tree
map('n', '<c-n>',       '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>nr',  '<cmd>NvimTreeRefresh<cr>')
map('n', '<leader>nf',  '<cmd>NvimTreeFindFile<cr>')

-- Buffer resize
map('n', '<a-H>', '<cmd>vertical resize -1<cr>')
map('n', '<a-J>', '<cmd>resize +1<cr>')
map('n', '<a-K>', '<cmd>resize -1<cr>')
map('n', '<a-L>', '<cmd>vertical resize +1<cr>')

-- Copy and Paste
map('n', '<leader>cc', 'ggVGg_"+y')
map('v', '<leader>cc', '"+y')
map('v', '<leader>cv', '"+p')

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
map('n', 'gk', '<cmd>exec "r!kjv -b -d -w -65" getreg("k")<cr>')

-- ------------------------------------------------------------------------- }}}
