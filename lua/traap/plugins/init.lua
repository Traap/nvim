-- {{{ init overview
--
-- Plugins below use default settings.
-- lazy.nvim recognizes:
--   enabled = true|false
--   event   = { ... }   -- I load on buffer events
--   ft      = { ... }   -- I load on filetypes
--
-- Philosophy:
-- I prefer to lazy-load everything. I do not want LazyVim reporting "5 plugins"
-- loaded and then, after opening the Lazy UI, finding several more auto-loaded.
-- As long as I do not enable LazyVim's bundled plugins, I meet my goal.
-- If I do enable LazyVim plugins, I accept extra features at the cost of some
-- plugins loading earlier than I want. This trade-off does not always work, but
-- I enjoy the configuration challenge.
--
-- Note:
-- I disable some LazyVim defaults. They are excellent plugins; I just do not
-- use them.
--
-- ------------------------------------------------------------------------- }}}
-- {{{ Global variables
local EVENT = nil
if pcall(require, "lazyvim") then
  EVENT = "VeryLazy"
else
  EVENT = { "BufReadPre", "BufNewFile" }
end

local PUML = { "puml" }
local RUBY = { "rb", "erb" }
local TEX = { "tex", "texx" }
local WIKI = { "md", "wiki" }

local platform = require("traap.core.platform")

-- ------------------------------------------------------------------------- }}}
-- {{{ Enable plugins when I'm not using vscode

if platform.is_nvim() then
  return {
    { enabled = false, event = EVENT, "RRethy/vim-illuminate" },
    { enabled = false, event = EVENT, "akinsho/bufferline.nvim" },
    { enabled = false, event = EVENT, "folke/flash.nvim" },
    {
      enabled = false,
      event = EVENT,
      "nvim-treesitter/nvim-treesitter-context",
    },
    {
      enabled = true,
      event = EVENT,
      "MagicDuck/grug-far.nvim",
      config = true,
    },
    {
      enabled = false,
      event = EVENT,
      "NvChad/nvim-colorizer.lua",
      config = true,
    },
    { enabled = true, event = EVENT, "Traap/vim-bundle-abbreviate" },
    { enabled = true, event = EVENT, "dkarter/bullets.vim" },
    { enabled = true, event = EVENT, "folke/lazydev.nvim" },
    { enabled = true, event = EVENT, "folke/trouble.nvim" },
    { enabled = true, event = EVENT, "lewis6991/gitsigns.nvim" },
    {
      enabled = true,
      event = EVENT,
      "nvim-mini/mini.ai",
      config = true,
    },
    {
      enabled = true,
      event = EVENT,
      "nvim-mini/mini.comment",
      config = true,
    },
    {
      enabled = false,
      event = EVENT,
      "nvim-mini/mini.indentscope",
      config = true,
    },
    {
      enabled = true,
      event = EVENT,
      "nvim-mini/mini.pairs",
      config = true,
    },
    {
      enabled = true,
      event = EVENT,
      "nvim-mini/mini.surround",
      config = true,
    },
    { enabled = true, event = EVENT, "rafamadriz/friendly-snippets" },
    { enabled = true, event = EVENT, "saghen/blink.cmp" },
    { enabled = true, event = EVENT, "tpope/vim-repeat" },
    { enabled = true, event = EVENT, "vim-utils/vim-most-minimal-folds" },
    { enabled = true, event = EVENT, "xiyaowong/virtcolumn.nvim" },
    { enabled = true, ft = RUBY,     "tpope/vim-bundler" },
    { enabled = true, ft = RUBY,     "tpope/vim-rails" },
    { enabled = true, ft = TEX,      "Traap/vim-bundle-vimtex" },
    {
      enabled = true,
      ft = WIKI,
      "Traap/vim-bundle-wiki.vim",
      dependencies = "lervag/wiki.vim",
    },
    {
      enabled = true,
      ft = WIKI,
      "lervag/wiki-ft.vim",
      dependencies = "lervag/wiki.vim",
    },
    { enabled = true, ft = WIKI, "lervag/wiki.vim" },
  }

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Enable plugins when I am using vscode.
else
  return {
    { enabled = false, event = EVENT, "RRethy/vim-illuminate" },
    { enabled = false, event = EVENT, "akinsho/bufferline.nvim" },
    { enabled = false, event = EVENT, "folke/flash.nvim" },
    {
      enabled = false,
      event = EVENT,
      "nvim-treesitter/nvim-treesitter-context",
    },
    {
      enabled = true,
      event = EVENT,
      "MagicDuck/grug-far.nvim",
      config = true,
    },
    { enabled = true, event = EVENT, "tpope/vim-repeat" },
    { enabled = true, event = EVENT, "vim-utils/vim-most-minimal-folds" },
    { enabled = true, event = EVENT, "xiyaowong/virtcolumn.nvim" },
    { enabled = true, ft = TEX,      "Traap/vim-bundle-vimtex" },
    {
      enabled = true,
      ft = WIKI,
      "Traap/vim-bundle-wiki.vim",
      dependencies = "lervag/wiki.vim",
    },
    {
      enabled = true,
      ft = WIKI,
      "lervag/wiki-ft.vim",
      dependencies = "lervag/wiki.vim",
    },
    { enabled = true, ft = WIKI, "lervag/wiki.vim" },
  }
end

-- ------------------------------------------------------------------------- }}}
