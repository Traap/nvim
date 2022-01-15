-- {{{ Use protected call so we don't error on first use.

local  packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer startup function definition.

packer = require('packer')
return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

use {'wbthomason/packer.nvim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Color scheme

use {'Traap/nvim-base16.lua', opt = false}
use {'norcalli/nvim-colorizer.lua', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion

use {'hrsh7th/nvim-cmp', opt = false}
use {'hrsh7th/cmp-buffer', opt = false}
use {'hrsh7th/cmp-calc', opt = false}
use {'hrsh7th/cmp-cmdline', opt = false}
use {'hrsh7th/cmp-nvim-lsp', opt = false}
use {'hrsh7th/cmp-nvim-lsp-document-symbol', opt = false}
use {'hrsh7th/cmp-nvim-lua', opt = false}
use {'hrsh7th/cmp-path', opt = false}
use {'f3fora/cmp-spell', opt = false}
use {'onsails/lspkind-nvim', opt = false}
-- use {'simrat39/symbols-outline.nvim'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Easyalign & snippets

use {'junegunn/vim-easy-align', opt = false}
use {'L3MON4D3/LuaSnip', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

use {'kyazdani42/nvim-tree.lua', opt = false}
use {'kyazdani42/nvim-web-devicons', opt = false}
use {'NTBBloodbath/galaxyline.nvim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Fuzzy finder

use {'nvim-telescope/telescope.nvim', opt = false}
use {'nvim-lua/popup.nvim', opt = false}
use {'nvim-lua/plenary.nvim', opt = false}
use {'nvim-telescope/telescope-media-files.nvim', opt = false}
use {'nvim-telescope/telescope-snippets.nvim', opt = false}
use {'norcalli/snippets.nvim', opt  = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua development

-- use {'tjdevries/nlua.nvim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

use {'neovim/nvim-lspconfig', opt = false}
    use {'williamboman/nvim-lsp-installer', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

use {'tweekmonster/startuptime.vim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

use {'aklt/plantuml-syntax', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

use {'tpope/vim-characterize', opt = false}
use {'tpope/vim-commentary', opt = false}
use {'tpope/vim-dispatch', opt = false}
use {'tpope/vim-endwise', opt = false}
use {'tpope/vim-fugitive', opt = false}
use {'tpope/vim-repeat', opt = false}
use {'tpope/vim-surround', opt = false}
use {'tpope/vim-unimpaired', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ RipGrep

use {'traap/vim-ripgrep', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', opt = false}
use {'romgrk/nvim-treesitter-context', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Tmux

use {'christoomey/vim-tmux-navigator', opt = false}
use {'christoomey/vim-tmux-runner', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

use {'sbdchd/neoformat', opt = false}
use {'triglav/vim-visual-increment', opt = false}
use {'vim-utils/vim-most-minimal-folds', opt = false}
use {'xiyaowong/nvim-transparent', opt = false}
use {'mechatroner/rainbow_csv', opt = false}
use {'iamcco/markdown-preview.nvim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

use {'lervag/vimtex', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

use {'lervag/wiki.vim', opt = false}
use {'dkarter/bullets.vim', opt = false}
use {'lervag/wiki-ft.vim', opt = false}

-- ------------------------------------------------------------------------- }}}
-- {{{ Zulu : Reuse Traap's vim bundles last.

use {'Traap/vim-bundle-autocmd', opt = false}
use {'Traap/vim-bundle-plantuml', opt = false}
use {'Traap/vim-bundle-vimtex', opt = false}
use {'Traap/vim-bundle-vimwiki', opt = false}

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
--       border = require('traap/config).display_boarder
--     }
--   }
-- )
end)

-- ------------------------------------------------------------------------- }}}
