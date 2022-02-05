-- {{{ Use protected call so we don't error on first use.

local  packer_ok, packer = pcall(require, 'packer')
if not packer_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer startup function definition.

return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

use {'wbthomason/packer.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Color scheme

use {'Traap/nvim-base16.lua'}
use {'norcalli/nvim-colorizer.lua'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion

use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-calc'}
use {'hrsh7th/cmp-cmdline'}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-nvim-lsp-document-symbol'}
use {'hrsh7th/cmp-nvim-lua'}
use {'hrsh7th/cmp-path'}
use {'onsails/lspkind-nvim'}
use {'saadparwaiz1/cmp_luasnip'}
-- use {'simrat39/symbols-outline.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Easyalign & snippets

use {'junegunn/vim-easy-align'}
use {'L3MON4D3/LuaSnip'}
use {'rafamadriz/friendly-snippets'}

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

use {'kyazdani42/nvim-tree.lua'}
use {'kyazdani42/nvim-web-devicons'}
use {'NTBBloodbath/galaxyline.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua development

-- use {'tjdevries/nlua.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

use {'neovim/nvim-lspconfig'}
use {'williamboman/nvim-lsp-installer'}
use {'jose-elias-alvarez/null-ls.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

use {'tweekmonster/startuptime.vim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

use {'aklt/plantuml-syntax'}

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

use {'tpope/vim-characterize'}
use {'tpope/vim-commentary'}
use {'tpope/vim-dispatch'}
use {'tpope/vim-endwise'}
use {'tpope/vim-fugitive'}
use {'tpope/vim-repeat'}
use {'tpope/vim-surround'}
use {'tpope/vim-unimpaired'}

-- ------------------------------------------------------------------------- }}}
-- {{{ RipGrep

use {'traap/vim-ripgrep'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope

use {'nvim-telescope/telescope.nvim'}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use {'nvim-lua/popup.nvim'}
use {'nvim-lua/plenary.nvim'}
use {'nvim-telescope/telescope-media-files.nvim'}
use {'nvim-telescope/telescope-snippets.nvim'}
use {'norcalli/snippets.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'romgrk/nvim-treesitter-context'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

use {'christoomey/vim-tmux-navigator'}
use {'christoomey/vim-tmux-runner'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

use {'sbdchd/neoformat'}
use {'triglav/vim-visual-increment'}
use {'vim-utils/vim-most-minimal-folds'}
use {'xiyaowong/nvim-transparent'}
use {'mechatroner/rainbow_csv'}
use {'iamcco/markdown-preview.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

use {'lervag/vimtex'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

use {'lervag/wiki.vim'}
use {'dkarter/bullets.vim'}
use {'lervag/wiki-ft.vim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

use {'Traap/vim-bundle-autocmd'}
use {'Traap/vim-bundle-plantuml'}
use {'Traap/vim-bundle-vimtex'}
use {'Traap/vim-bundle-vimwiki'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

if vim.g.nvim_bootstrapped == 1 then
  packer.sync()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Display boarders

-- end,
--   {
--     display = {
--       border = require('traap.config).display_boarder
--     }
--   }
-- )
end)

-- ------------------------------------------------------------------------- }}}
