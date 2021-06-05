My *100% Pure Virgin Coconut Oil* neovim configuration done with Lua.

### Credits
* [siduck76](https://github.com/siduck76/neovim-dotfiles)
* [ThePrimeagen](https://github.com/ThePrimeagen)
* [ThePrimeagen Discord](https://discord.gg/3ujcVMe)
* [TJ DeVries](https://github.com/tjdevries)

### Todo 
 - [x] Install nerdfonts hack to configure missing icons 
 - [x] Automate nvim bootstrapping.
 - [ ] Automate treesitter bootstrapping.
 - [ ] settings.lua does not appear to fire the first file edited.
 - [ ] Display neovim welcome page. 
 - [ ] Configure snippets.
 - [ ] Complete user acceptance testing with all plugins loaded.


### Package Manager
* [Packer](https://github.com/wbthomason/packer.nvim)

### Colors
* [Base16](https://github.com/siduck76/nvim-base16.lua)
* [Colorizer](https://github.com/norcalli/nvim-colorizer.lua)

### Fuzzy
* [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* [Popup](https://github.com/vim-lua/popup.nvim)
* [Plenary](https://github.com/nvim-lua/plenary.nvim)
* [Telescope Media Files](https://github.com/nvim-telescope/telescope-media-files.nvim)
* [Telesope Snippets](https://github.com/nvim-telescope/telescope-snippets.nvim)
* [Snippets](https://github.com/norcalli/snippets.nvim)

### Language Server
* [Lua Development](https://github.com/tjdevries/nlua.nvim)

### neovim without Tim Pope?  No Way!!!
* [Commentary](https://github.com/tpope/vim-commentary)
* [Dispatch](https://github.com/tpope/vim-dispatch)
* [Endwise](https://github.com/tpope/vim-endwise)
* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Surround](https://github.com/tpope/vim-surround)
* [Unimpaired](https://github.com/tpope/vim-unimpaired)

### File Manager 
* [Tree](https://github.com/kyazdani42/nvim-tree.lua)

### LaTeX and Wiki
* [VimTeX](https://github.com/lervag/vimtex)
* [Wiki](https://github.com/lervag/wiki.vim)
* [Wiki File Type](https://github.com/lervag/wiki-ft.vim)

### Utilities 
* [Easy Align](https://github.com/junegunn/vim-easy-align)
* [Galaxyline](https://github.com/glepnir/galaxyline.nvim)
* [Neoformat](https://github.com/sbdchd/neoformat)
* [Tweek Monster](https://github.com/tweekmonster/startuptime.vim)
* [Web Devicons](https://github.com/kyazdani42/nvim-web-devicons)

### Simple and Sweet folder structure.

```
nvim
├── init.lua
├── LICENSE
├── lua
│   ├── bootstrap.lua
│   ├── plugins.lua
│   └── traap
│       ├── compe-completion.lua
│       ├── galaxyline-nvim.lua
│       ├── highlights.lua
│       ├── init.lua
│       ├── keybindings.lua
│       ├── language-servers.lua
│       ├── nvim-tree.lua
│       ├── nvim-web-devicons.lua
│       ├── settings.lua
│       ├── telescope-nvim.lua
│       ├── treesitter-nvim.lua
│       ├── vimtex.lua
│       └── wiki-vim.lua
├── plugin
│   └── packer_compiled.vim
└── README.md

```
