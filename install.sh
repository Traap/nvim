#!/bin/bash
# Nuke neovim and start over :)
sudo rm -rfI ~/.cache/nvim
sudo rm -rfI ~/.local/share/nvim
sudo rm -rfI ~/.config/nvim

# Clone Traap/nvim
git clone https://github.com/Traap/nvim ~/.config/nvim

# My neovim installation bootstraps itself.
nvim

# Parting words.
echo "Exit nvim and restart nvim to allow Treesitter to finish."
echo "Use LspInstall to install language servers."
