My *100% Pure Virgin Coconut Oil* neovim configuration done with Lua.

### Credits
* [Christian Chiarulli](https://github.com/ChristianChiarulli/LunarVim)
* [NeoVim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
* [TJ DeVries](https://github.com/tjdevries)
* [ThePrimeagen Discord](https://discord.gg/3ujcVMe)
* [ThePrimeagen](https://github.com/ThePrimeagen)
* [siduck76](https://github.com/siduck76/neovim-dotfiles)

### Linux Bash Installation

I install or reset NeoVim using [resetNeoVim](https://github.com/Traap/dotfiles/blob/master/bin/resetNeoVim) which does the following.


1. Force removes these folders:
  1. ~/.cache/nvim
  2. ~/.config/nvim
  3. ~/.local/share/nvim
  4. ~/git/neovim
2. Clones and builds NeoVim
3. Clones or updates this repository
4. Creates ~/.config/nvim when needed.
5. Establishes a symbolic link between ~/git/nvim and ~/.config/nvim
6. Starts nvim to load plugins.
