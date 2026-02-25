-- {{{ Alphabetical listing of settings I like.

-- NOTE: formatoptions default "tcqj"
local options = {
  autoread = true,
  autowrite = true,
  breakindent = true,
  clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus",
  colorcolumn = "+1",
  cmdheight = 0,
  complete = { ".", "w", "b", "u", "t", "i", "kspell" },
  completeopt = { "menuone", "noselect" },
  cursorline = false,
  expandtab = true,
  fillchars = { foldclose = " ", fold = " ", eob = " " },
  foldlevel = 0,
  foldmethod = "marker",
  hidden = true,
  inccommand = "split",
  ignorecase = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  mouse = "a",
  nrformats = { "alpha", "octal", "hex" },
  number = true,
  numberwidth = 3,

  -- Popup blend
  pumblend = 10,

  -- Maximum number of entries in a popup
  pumheight = 10,
  relativenumber = true,
  scrolloff = 0,
  shiftround = true,
  shiftwidth = 2,
  shortmess = "aToIOWAF",
  showbreak = "↪",
  showmatch = true,
  showmode = false,
  sidescrolloff = 0,
  signcolumn = "yes:3",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  textwidth = 80,
  timeout = true,
  timeoutlen = vim.g.vscode and 1000 or 270,
  ttimeout = true,
  ttimeoutlen = 5,
  updatetime = 500,
  virtualedit = { "block" },
  wildmode = { "longest:full", "full" },
  winborder = 'rounded',
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.formatoptions:remove("o")

vim.cmd [[set termguicolors]]
vim.cmd([[filetype plugin indent on]])

vim.g.have_nerd_font = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

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
