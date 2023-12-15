Traap's *Blazing Fast* Neovim configuration.

## v0.9.5-lazyvim branch
This branch is here to support switching Neovim environments.  The branch uses
both lazy.nvim and LazyVim plugins.  I will only make patches when and if
needed.

### Credits
* [Folke Lamaitre](https://github.com/folke)
* [LazyVim](https://github.com/LazyVim/LazyVim)

### Linux Bash Installation
[resetNeovim](https://github.com/Traap/dotfiles/blob/master/bash/bin/resetNeovim) does the following:
1. Uses [bnvim](https://github.com/Traap/dotfiles/blob/master/bash/bin/bnvim) to clone or pull Neovim sources and build them.
2. Uses "[switchNeovim](https://github.com/Traap/dotfiles/blob/master/bash/bin/switchNeovim) traap" to switch to my Neovim configuration.

### Notes
1. Backups are not done.
2. *You have been warned.*

### Extra credit
Try [nvims](https://github.com/Traap/nvims) to safely experiment with multiple Neovim configurations.
