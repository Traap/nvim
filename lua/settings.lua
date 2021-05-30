local  utils = require('utils')

local cmd = vim.cmd
local opt = utils.opt

local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)

opt('o', 'clipboard', 'unnamed,unnamedplus')
opt('o', 'colorcolumn', '+1')
opt('o', 'complete', '.,w,b,u,t,i,kspell')
opt('o', 'foldmethod', 'marker')
opt('o', 'hidden', true)
opt('o', 'ignorecase', true)
opt('o', 'numberwidth', 3)
opt('o', 'scrolloff', 4)
opt('o', 'shiftround', true)
opt('o', 'shiftwidth', 2)
opt('o', 'signcolumn', 'yes')
opt('o', 'smartcase', true)
opt('o', 'softtabstop', 2)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'textwidth', 80)
opt('o', 'wildmode', 'list:longest')

opt('w', 'number', true)
opt('w', 'relativenumber', true)

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
