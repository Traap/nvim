Traap's *Blazing Fast* Neovim configuration.

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
Try [nvims](https://github.com/Traap/dotfiles/blob/master/bash/bin/nvims) to safely experiment with multiple Neovim configurations.

### Overview
This is a personal Neovim configuration built around `lazy.nvim`, with a small
amount of LazyVim-compatible behavior but without relying on the full default
LazyVim plugin set. The entrypoint in `init.lua` bootstraps the plugin manager,
applies custom options/autocommands/keymaps, and then loads a hand-curated
plugin collection from `lua/traap/plugins`.

The editing defaults are intentionally opinionated: two-space indentation,
`textwidth=80`, relative line numbers, rounded floating windows, transparent
TokyoNight styling, aggressive lazy-loading, and custom highlight tweaks for
popups, diagnostics, and picker borders. The config also creates missing parent
directories on save, restores cursor position, customizes format options per
filetype, and disables autoformat for `csv`, `sh`, and `tex`.

Core workflow features are centered on:
- `Snacks.nvim` for dashboard, explorer, pickers, scratch buffers,
  notifications, git tools, and editor toggles.
- `blink.cmp` for completion, snippets, ghost text, command-line completion, and
  signature help.
- Built-in LSP with `mason.nvim` and `nvim-lspconfig`, including on-demand
  server setup by filetype and format-on-save when the server supports it.
- `treesitter` with automatic parser installation for active filetypes.
- `which-key`, `lualine`, `noice`, `gitsigns`, `trouble`, `bqf`, and
  `tmux-navigator` for navigation and UI polish.

The config is tuned for several personal workflows beyond general coding: wiki
and journal editing with `wiki.vim`, LaTeX authoring with `vimtex`, Git work
with `fugitive`, SQL browsing with `dadbod-ui`, PlantUML authoring, image
pasting into notes, Harpoon file marks, and AI integrations through both
`ChatGPT.nvim` and `CopilotChat.nvim`.

It also contains platform-aware behavior. When running inside VS Code, the setup
trims down to a smaller plugin set and remaps a few actions to VS Code commands
instead of enabling the full Neovim UI stack.
