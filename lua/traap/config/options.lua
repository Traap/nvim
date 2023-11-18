-- {{{ Alphabetical listing of settings I like.

local options = {
  breakindent = true,
  clipboard = "unnamedplus",
  colorcolumn = "+1",
  complete = { ".", "w", "b", "u", "t", "i", "kspell" },
  -- completeopt = { "menuone", "noinsert", "noselect" },
  completeopt = { "menuone", "noselect" },
  cursorline = false,
  expandtab = true,
  fillchars = { foldclose = " ", fold = " ", eob = " " },
  foldlevel = 0,
  foldmethod = "marker",
  hidden = true,
  ignorecase = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  mouse = "a",
  nrformats = { "alpha", "octal", "hex" },
  number = true,
  numberwidth = 3,
  relativenumber = true,
  scrolloff = 4,
  shiftround = true,
  shiftwidth = 2,
  shortmess = "aToO",
  showbreak = "↪",
  showmatch = true,
  showmode = false,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  timeoutlen = 350,
  textwidth = 80,
  updatetime = 350,
  virtualedit = { "block" },
  wildmode = { "list", "longest" },
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd[[set termguicolors]]
vim.cmd([[filetype plugin indent on]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Bullets

vim.g.bullets_enabled_file_types = {
  "gitcommit",
  "markdown",
  "scratch",
  "text",
  "wiki",
}

-- ------------------------------------------------------------------------- }}}
