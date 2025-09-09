-- Control control event for plugins I use with defaults. Yep! This means I
-- may be disabling plugins LazyVim uses by default.  And, I explicitly
-- manage the dependencies when needed.
local EVENT = require("traap.config.events").file
local CSV = {"csv", "tsv"}
local TEX = {"tex", "texx"}
local WIKI = {"md", "wiki"}

return {
  -- File based events.
  {enabled = true,  event = EVENT, "Traap/vim-bundle-abbreviate" },
  {enabled = false, event = EVENT, "akinsho/bufferline.nvim" },
  {enabled = true,  event = EVENT, "dkarter/bullets.vim" },
  {enabled = true , event = EVENT, "saghen/blink.cmp" },
  {enabled = true,  event = EVENT, "echasnovski/mini.ai" },
  {enabled = true,  event = EVENT, "echasnovski/mini.comment" },
  {enabled = false, event = EVENT, "echasnovski/mini.indentscope" },
  {enabled = true,  event = EVENT, "echasnovski/mini.pairs" },
  {enabled = true,  event = EVENT, "echasnovski/mini.surround" },
  {enabled = false, event = EVENT, "rcarriga/nvim-notify" },
  {enabled = false, event = EVENT, "folke/flash.nvim" },
  {enabled = true,  event = EVENT, "folke/trouble.nvim" },
  {enabled = true,  event = EVENT, "MagicDuck/grug-far.nvim" },
  {enabled = true,  event = EVENT, "NvChad/nvim-colorizer.lua", config = true },
  {enabled = false, event = EVENT, "nvim-treesitter/nvim-treesitter-context" },
  {enabled = true,  event = EVENT, "rcarriga/nvim-notify" },
  {enabled = true,  event = EVENT, "aklt/plantuml-syntax" },
  {enabled = true,  event = EVENT, "tpope/vim-bundler" },
  {enabled = true,  event = EVENT, "tpope/vim-rails" },
  {enabled = true,  event = EVENT, "tpope/vim-repeat" },
  {enabled = false, event = EVENT, "RRethy/vim-illuminate" },
  {enabled = true,  event = EVENT, "vim-utils/vim-most-minimal-folds" },
  {enabled = true,  event = EVENT, "xiyaowong/virtcolumn.nvim" },

  {enabled = true,  event = EVENT, "mrjones2014/nvim-ts-rainbow",
                    dependencies = "nvim-treesitter/nvim-treesitter" },
  {enabled = true,  event = EVENT, "nvim-treesitter/nvim-treesitter-textobjects",
                    dependencies = "nvim-treesitter/nvim-treesitter"},

  -- File type events
  {enabled = true,  ft = CSV,  "mechatroner/rainbow_csv" },
  {enabled = true,  ft = TEX,  "Traap/vim-bundle-vimtex" },
  {enabled = true,  ft = WIKI, "lervag/wiki.vim" },
  {enabled = true,  ft = WIKI, "Traap/vim-bundle-wiki.vim", dependencies = "lervag/wiki.vim" },
  {enabled = true,  ft = WIKI, "lervag/wiki-ft.vim", dependencies = "lervag/wiki.vim" },


  -- lazy = true based
  {enabled = true,  lazy = true, "rafamadriz/friendly-snippets" },
}

