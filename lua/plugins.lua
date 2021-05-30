
return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'chriskempson/base16-vim' }

  -- Fuzzy finder
  use {
       'nvim-telescope/telescope.nvim',
       requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
   }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- neovim without Tpope.  Now Way!!! 
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-unimpaired' }

end)
