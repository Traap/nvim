local function option(...) vim.api.nvim_set_option(...) end
local cmd = vim.cmd
local g = vim.g

option('clipboard', 'unnamed,unnamedplus')
option('colorcolumn', '+1')
option('complete', '.,w,b,u,t,i,kspell')
option('completeopt', 'menuone,noinsert,noselect')
option('expandtab', true)
option('foldmethod', 'marker')
option('hidden', true)
option('ignorecase', true)
option('number', true)
option('numberwidth', 3)
option('relativenumber', true)
option('scrolloff', 4)
option('shiftround', true)
option('shiftwidth', 2)
option('shortmess', 'c')
option('signcolumn', 'yes')
option('smartcase', true)
option('smartindent', true)
option('softtabstop', 2)
option('splitbelow', true)
option('splitright', true)
option('termguicolors', true)
option('textwidth', 80)
option('wildmode', 'list:longest')

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'filetype plugin indent on'
cmd 'syntax enable'

-- Colors
local base16 = require 'base16'
base16(base16.themes['onedark'],true)
--
-- Completion confirmation.
g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
