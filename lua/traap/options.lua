-- {{{ Alphabetical listing of settings I like.

local options = {
  clipboard = 'unnamedplus',
  colorcolumn = '+1',
  complete = { '.', 'w', 'b', 'u', 't', 'i', 'kspell' },
  completeopt = { 'menuone', 'noinsert', 'noselect' },
  cursorline = false,
  expandtab = true,
  fillchars = 'fold: ',
  foldlevel = 20,
  foldmethod = 'marker',
  hidden = true,
  ignorecase = true,
  lazyredraw = true,
  listchars = { eol = '↲', tab = '▸ ', trail = '·' },
  mouse = 'a',
  nrformats = { 'alpha', 'octal', 'hex' },
  number = true,
  numberwidth = 3,
  relativenumber = true,
  scrolloff = 4,
  shiftround = true,
  shiftwidth = 2,
  shortmess = 'aToOS',
  showbreak = '↪',
  showmatch = true,
  showmode = false,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 500,
  textwidth = 80,
  virtualedit = { 'block' },
  wildmode = { 'list', 'longest' },
  wrap = false,
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[filetype plugin indent on]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

vim.cmd([[
  augroup YankGroup
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
  augroup END
]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

vim.g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'scratch',
  'text',
  'wiki'
}

-- ------------------------------------------------------------------------- }}}
