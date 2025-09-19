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

-- local EVENT = {"BufReadPost", "BufNewFile", "BufWritePre"}
local EVENT = 'VeryLazy'
local TEX = {"tex", "texx"}
local WIKI = {"md", "wiki"}

-- ------------------------------------------------------------------------- }}}
return {
  -- {{{ File based events.

  {enabled = false, event = EVENT, "RRethy/vim-illuminate" },
  {enabled = false, event = EVENT, "akinsho/bufferline.nvim" },
  {enabled = false, event = EVENT, "folke/flash.nvim" },
  {enabled = false, event = EVENT, "nvim-treesitter/nvim-treesitter-context" },
  {enabled = false, event = EVENT, "rcarriga/nvim-notify" },

  {enabled = true , event = EVENT, "saghen/blink.cmp" },
  {enabled = true,  event = EVENT, "NvChad/nvim-colorizer.lua", config = true },
  {enabled = true,  event = EVENT, "Traap/vim-bundle-abbreviate" },
  {enabled = true,  event = EVENT, "aklt/plantuml-syntax" },
  {enabled = true,  event = EVENT, "dkarter/bullets.vim" },
  {enabled = true,  event = EVENT, "nvim-mini/mini.ai" },
  {enabled = true,  event = EVENT, "nvim-mini/mini.comment" },
  {enabled = true,  event = EVENT, "nvim-mini/mini.indentscope" },
  {enabled = true,  event = EVENT, "nvim-mini/mini.pairs" },
  {enabled = true,  event = EVENT, "nvim-mini/mini.surround" },
  {enabled = true,  event = EVENT, "folke/trouble.nvim" },
  {enabled = true,  event = EVENT, "rcarriga/nvim-notify" },
  {enabled = true,  event = EVENT, "tpope/vim-bundler" },
  {enabled = true,  event = EVENT, "tpope/vim-rails" },
  {enabled = true,  event = EVENT, "tpope/vim-repeat" },
  {enabled = true,  event = EVENT, "vim-utils/vim-most-minimal-folds" },
  {enabled = true,  event = EVENT, "xiyaowong/virtcolumn.nvim" },
  {enabled = true,  event = EVENT, "rafamadriz/friendly-snippets" },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ File type events

  {enabled = true,  ft = TEX,  "Traap/vim-bundle-vimtex" },
  {enabled = true,  ft = WIKI, "lervag/wiki.vim" },
  {enabled = true,  ft = WIKI, "Traap/vim-bundle-wiki.vim", dependencies = "lervag/wiki.vim" },
  {enabled = true,  ft = WIKI, "lervag/wiki-ft.vim", dependencies = "lervag/wiki.vim" },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ lazy = true based


  -- ----------------------------------------------------------------------- }}}
}

