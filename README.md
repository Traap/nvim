My *100% Pure Virgin Coconut Oil* neovim configuration done with Lua.

### Credits
* [siduck76](https://github.com/siduck76/neovim-dotfiles)
* [ThePrimeagen](https://github.com/ThePrimeagen)
* [ThePrimeagen Discord](https://discord.gg/3ujcVMe)
* [TJ DeVries](https://github.com/tjdevries)
* [Christian Chiarulli](https://github.com/ChristianChiarulli/LunarVim)

### Disclaimer
  1. I use this script on my Linux computers.
  2. This script does not perform any error checking.
  3. This script does remove ~/.cache/nvim, ~/.local/nvim, and ~/.config/nvim.

### Linux Bash Installation
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Traap/nvim/master/install.sh)"
```
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

### Todo
 - [x] Install nerdfonts hack to configure missing icons
 - [x] Automate nvim bootstrapping.
 - [x] Automate treesitter bootstrapping.
 - [x] settings.lua does not appear to fire the first file edited.
 - [ ] Display neovim welcome page.
 - [x] Configure Galaxy Line.
 - [ ] Configure snippets.
 - [x] Analyze checkhealth feedback
 - [ ] Complete user acceptance testing with all plugins loaded.

### Simple and Sweet folder structure.

```
nvim
├── init.lua
├── install.sh
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
│       └── treesitter-nvim.lua
├── package-lock.json
├── plugin
│   └── packer_compiled.vim
├── README.md
└── spell
    ├── en.utf-8.add
    └── en.utf-8.add.spl
```
