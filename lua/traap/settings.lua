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
opt.expandtab = true
opt.fillchars = 'fold: '
opt.foldmethod = 'marker'
opt.hidden = true
opt.ignorecase = true
opt.lazyredraw = true
opt.number = true
opt.numberwidth= 3
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = 'aToOS'
opt.showbreak = '↪'
opt.showmatch = true
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

cmd([[filetype plugin indent on]])
cmd([[syntax enable]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

cmd([[
  augroup YankGroup
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Remove whitespaces

cmd([[
  augroup RemoveWhiteSpaceGroup
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion confirmation.

g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- ------------------------------------------------------------------------- }}}
