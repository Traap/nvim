-- {{{ Packer startup function definition.

local g = vim.g
local packer = require('packer')

return packer.startup(function(use)

-- ------------------------------------------------------------------------- }}}
-- {{{ Packer can manage itself as an optional plugin.

    use {'wbthomason/packer.nvim', opt = true}

-- ------------------------------------------------------------------------- }}}
-- {{{ Color scheme

    use 'norcalli/nvim-colorizer.lua'
    use 'Traap/nvim-base16.lua'

-- ------------------------------------------------------------------------- }}}
-- {{{ Easyalign

    use 'junegunn/vim-easy-align'

-- ------------------------------------------------------------------------- }}}
-- {{{ File manager

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'plugins.nvim-tree' end
  }

  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/galaxyline.nvim'

-- ------------------------------------------------------------------------- }}}
-- {{{ Fuzzy finder

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-media-files.nvim',
        'nvim-telescope/telescope-snippets.nvim',
        'norcalli/snippets.nvim'
      }
    }

-- ------------------------------------------------------------------------- }}}
-- {{{ Lua development

    use { 'tjdevries/nlua.nvim' }

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP and completion

    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'nvim-lua/completion-nvim'
    use 'hrsh7th/nvim-compe'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

-- ------------------------------------------------------------------------- }}}
-- {{{ Profiling

    use 'tweekmonster/startuptime.vim'

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

    use {
      'aklt/plantuml-syntax',
      requires = {
        'Traap/vim-bundle-plantuml'
      }
    }

-- ------------------------------------------------------------------------- }}}
-- {{{ neovim without Tpope?  No Way!!!

    use 'tpope/vim-commentary'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-endwise'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'

-- ------------------------------------------------------------------------- }}}
-- {{{ RipGrep

    use 'traap/vim-ripgrep'

-- ------------------------------------------------------------------------- }}}
-- {{{ Utility

    use 'christoomey/vim-tmux-navigator'
    use 'sbdchd/neoformat'
    use 'triglav/vim-visual-increment'
    use 'vim-utils/vim-most-minimal-folds'

-- ------------------------------------------------------------------------- }}}
-- {{{ VimTex

    use {
      'lervag/vimtex',
      requires = {
        'Traap/vim-bundle-vimtex'
      }
    }

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki.Vim

    use {
      'lervag/wiki.vim',
      requires = {
        'Traap/vim-bundle-vimwiki',
        'dkarter/bullets.vim',
        'lervag/wiki-ft.vim'
      }
    }

-- ------------------------------------------------------------------------- }}}
-- {{{ Auto compile and install plugins when packer is bootstrapped.

    if g.nvim_bootstrapped == 1 then
      packer.compile('plugin/packer_compiled.vim')
      packer.install()
    end
  end,

-- ------------------------------------------------------------------------- }}}
-- {{{ Display boarders

  {
    display = {
      border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
    }
  }
)
-- ------------------------------------------------------------------------- }}}
