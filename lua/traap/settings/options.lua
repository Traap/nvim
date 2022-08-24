-- {{{ Alias to vim APis.

local   g = vim.g
local cmd = vim.cmd
local opt = vim.opt

-- ------------------------------------------------------------------------- }}}
-- {{{ Alphabetical listing of settings I like.

-- opt.background = "dark"
opt.clipboard = 'unnamedplus'
opt.colorcolumn = '+1'
opt.complete = {'.', 'w' , 'b', 'u', 't', 'i', 'kspell'}
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.cursorline = false
opt.expandtab = true
opt.fillchars = 'fold: '
opt.foldlevel = 20
opt.foldmethod = 'marker'
opt.hidden = true
opt.ignorecase = true
opt.lazyredraw = true
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
opt.mouse = 'a'
opt.nrformats = {'alpha', 'octal', 'hex'}
opt.number = true
opt.numberwidth = 3
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
opt.timeoutlen = 250
opt.textwidth = 80
opt.virtualedit = {'block'}
opt.wildmode = {'list', 'longest'}
opt.wrap = true
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

-- g.completion_confirm_key = ""
-- g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

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
