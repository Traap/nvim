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

cmd([[filetype plugin indent on]])
cmd([[syntax enable]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion confirmation.

g.completion_confirm_key = ""
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUml

cmd([[

augroup plantuml_group
  autocmd!
  autocmd BufRead,BufNewFile *.puml,*.wsd :call InitUmlSettings()
  autocmd BufWritePost       *.puml,*.wsd :call GenerateUmlDiagram()
  autocmd BufLeave           *.puml,*.wsd :call ClearUmlLaunchFlag()
augroup END

]])

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
-- {{{ Bullets

g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'scratch',
  'text',
  'wiki'
}

-- ------------------------------------------------------------------------- }}}
-- {{{ wiki.vim

cmd([[
  augroup WikiGroup
    autocmd!
    autocmd FileType wiki,md,markdown setlocal foldlevelstart=1
    autocmd FileType wiki,md,markdown setlocal filetype=wiki
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
