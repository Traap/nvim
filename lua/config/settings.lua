local function set(...) vim.api.nvim_set_option(...) end
local cmd = vim.cmd
local g = vim.g

set('clipboard', 'unnamedplus')
set('colorcolumn', '+1')
set('complete', '.,w,b,u,t,i,kspell')
set('completeopt', 'menuone,noinsert,noselect')
set('expandtab', true)
set('foldmethod', 'marker')
set('hidden', true)
set('ignorecase', true)
set('lazyredraw', true)
set('number', true)
set('numberwidth', 3)
set('relativenumber', true)
set('scrolloff', 4)
set('shiftround', true)
set('shiftwidth', 2)
set('shortmess', 'c')
set('signcolumn', 'yes')
set('showbreak','↪')
set('showmatch', true)
set('smartcase', true)
set('smartindent', true)
set('softtabstop', 2)
set('splitbelow', true)
set('splitright', true)
set('termguicolors', true)
set('textwidth', 80)
set('virtualedit', 'block')
set('wildmode', 'list:longest')

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'filetype plugin indent on'
cmd 'syntax enable'

-- Colors
local base16 = require 'base16'
base16(base16.themes['onedark'],true)

-- Completion confirmation.
g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
