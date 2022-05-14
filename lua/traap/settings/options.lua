-- {{{ Alias to vim APis.

local   g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- ------------------------------------------------------------------------- }}}
-- {{{ Alphebetical listing of settings I like.

opt.clipboard = 'unnamedplus'
opt.colorcolumn = '+1'
opt.complete = {'.', 'w' , 'b', 'u', 't', 'i', 'kspell'}
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.cursorline = true
opt.expandtab = true
opt.fillchars = 'fold: '
opt.foldmethod = 'marker'
opt.hidden = true
opt.ignorecase = true
opt.lazyredraw = true
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
opt.nrformats = {'alpha', 'octal', 'hex'}
opt.number = true
opt.numberwidth= 3
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = 'aToOS'
opt.showbreak = '↪'
opt.showmatch = true
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop =  2
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.textwidth = 80
opt.virtualedit = {'block'}
opt.wildmode = {'list', 'longest'}
opt.wrap = false
cmd([[filetype plugin indent on]])
cmd([[syntax enable]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion confirmation.

g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

cmd([[
  augroup YankGroup
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion confirmation.

g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Back to normal mode when input timer expiers.
--
--     I use a 30sec time because I am generally reading other documents when I
--     making edits.

cmd([[
  augroup BackToNormalGroup
    autocmd!
    autocmd CursorHoldI * stopinsert
    autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=30000
    autocmd InsertLeave * let &updatetime=updaterestore
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'scratch',
  'text',
  'wiki'
}

-- ------------------------------------------------------------------------- }}}
-- {{{ base16 chalk colors

-- g.transparent_enabled = true
-- local base16 = require 'base16'
-- base16(base16.themes('chalk'), true)

-- ------------------------------------------------------------------------- }}}
