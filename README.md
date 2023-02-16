My *100% Pure Virgin Coconut Oil* neovim configuration done with Lua.

### v.0.6.8-packer branch
This branch is here to support switching Neovim environments.  The branch uses
packer.  I only make patches when and if needed.

### Credits
* [Christian Chiarulli](https://github.com/ChristianChiarulli/LunarVim)
* [NeoVim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
* [TJ DeVries](https://github.com/tjdevries)
* [ThePrimeagen Discord](https://discord.gg/3ujcVMe)
* [ThePrimeagen](https://github.com/ThePrimeagen)
* [siduck76](https://github.com/siduck76/neovim-dotfiles)

### Linux Bash Installation

I install or reset NeoVim using [switchNeoVim](https://github.com/Traap/dotfiles/blob/master/bin/switchNeoVim) which does the following.

1. Force removes these folders:
  1. ~/.cache/nvim
  2. ~/.config/nvim
  3. ~/.local/share/nvim
  3. ~/.local/state/nvim
2. Establishes a symbolic link between ~/git/nvim and ~/.config/nvim
6. Starts nvim to load plugins.

### LunarVim Configuration
This repository and [lvim](https://github.com/traap/lvim) are similar.  I use LunarVim
defaults where they make since to me and do not conflict too
much with configurations done here.
