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
`nvim.traap` is my production Neovim configuration. It is powered by
[`lazy.nvim`](https://github.com/folke/lazy.nvim), uses Neovim's native LSP
client, and borrows selected conventions from LazyVim without loading the
LazyVim distribution or its default plugin set.

The configuration favors deliberate lazy loading and a small startup surface.
It provides a complete coding environment when launched in Neovim and a reduced
integration layer when embedded in VS Code.

### Requirements

- A recent Neovim release with the native `vim.lsp.config()` and
  `vim.lsp.enable()` APIs.
- Git, which bootstraps `lazy.nvim` and installs plugins.
- A Nerd Font for icons used throughout the interface.
- `ripgrep` for Snacks grep and todo searches.
- Node.js and Yarn to build `markdown-preview.nvim`.
- `mise` with Ruby 4.0.0 and Solargraph for Ruby LSP support.
- `nixd` on `PATH` for Nix LSP support.

Language servers managed by Mason may have additional runtime requirements.
Use `:checkhealth`, `:checkhealth vim.lsp`, and `:Mason` when diagnosing a
missing tool.

### Startup and package management

[`init.lua`](init.lua) owns the startup sequence:

1. Set the global and local leader to `<Space>`.
2. Bootstrap `lazy.nvim` into Neovim's data directory when it is absent.
3. Load the curated plugin specifications from `lua/traap/plugins`.
4. Apply options, autocommands, keymaps, clipboard integration, and platform
   detection.
5. Apply TokyoNight when running in standalone Neovim.

Plugins are intentionally unversioned so updates follow their current upstream
branches. The automatic update checker and configuration-change notifications
are disabled. `lazy-lock.json` records the working revisions.

Useful package commands:

| Command | Purpose |
| --- | --- |
| `:Lazy` | Open the plugin manager. |
| `:Lazy sync` | Install missing plugins, update plugins, and remove unused plugins. |
| `:Lazy update` | Update installed plugins and the lockfile. |
| `:Lazy clean` | Remove plugins no longer present in the specification. |
| `:Lazy profile` | Inspect startup and plugin load times. |
| `:Mason` | Inspect language-server installations. |

### Configuration layout

| Path | Responsibility |
| --- | --- |
| `init.lua` | Entrypoint and startup ordering. |
| `lua/traap/config/bootstrap.lua` | Installs and adds `lazy.nvim` to the runtime path. |
| `lua/traap/config/lazy.lua` | Package-manager policy and UI. |
| `lua/traap/config/options.lua` | Global editor defaults. |
| `lua/traap/config/autocmds.lua` | Filetype and buffer lifecycle behavior. |
| `lua/traap/config/keymaps.lua` | Core, plugin, LSP, and platform mappings. |
| `lua/traap/plugins/` | Curated plugin specifications and customizations. |
| `lua/traap/lsp/servers.lua` | Filetype-to-server registry and server overrides. |
| `lua/traap/lsp/config.lua` | LSP capabilities, installation, setup, and formatting. |
| `lua/traap/lsp/init.lua` | Native LSP compatibility commands. |
| `lua/traap/core/` | Clipboard, notifications, platform detection, wiki helpers, and utilities. |

### Editor behavior

The principal defaults are two-space indentation, an 80-column text width,
relative line numbers, persistent sign columns, rounded floating windows,
right/below splits, no swapfile, and no line wrapping. The system clipboard is
used locally; remote SSH sessions retain Neovim's internal clipboard.

Autocommands add several workflow conveniences:

- Create missing parent directories immediately before saving.
- Restore the last cursor location when reopening ordinary files.
- Close help, quickfix, Fugitive, health, and similar utility windows with `q`.
- Apply prose- and comment-friendly format options to supported source files.
- Mark `csv`, `sh`, and `tex` buffers with `vim.b.autoformat = false`.
- Reapply custom purple borders and UI highlights after colorscheme changes.

### Significant plugin customizations

#### Snacks.nvim

Snacks is the main interface layer. Its dashboard identifies this configuration
as powered by `lazy.nvim`; explorer, file and grep pickers, Git browsing,
notifications, buffer deletion, status column, word references, toggles, image
support, and Zen mode are enabled. Animation, indentation guides, scrolling,
terminal, and Lazygit integrations are deliberately disabled.

The explorer and picker cooperate with tmux: `<C-h>`, `<C-j>`, `<C-k>`, and
`<C-l>` leave the picker and move in the requested direction when there is no
adjacent Neovim window.

Frequently used mappings include:

| Mapping | Action |
| --- | --- |
| `<leader>e` | Open the explorer. |
| `<leader>ff` / `<leader>fg` | Find files / Git files. |
| `<leader>fb` / `<leader>fr` | Find buffers / recent files. |
| `<leader>sg` / `<leader>sw` | Grep text / grep the word or selection. |
| `<leader>sd` / `<leader>sD` | Show workspace / buffer diagnostics. |
| `<leader>gb` / `<leader>gl` | Browse Git branches / log. |
| `<leader>gB` | Open the current location with Git browse. |

#### Completion and Lua development

`blink.cmp` combines buffer, LSP, path, and snippet sources. It enables command
line completion, friendly snippets, ghost text, signature help, automatic
documentation after 500 ms, and Rust-backed fuzzy matching when available.
Completion capabilities are injected into every configured LSP server.

`lazydev.nvim` supplies Neovim Lua runtime metadata so completion and diagnostics
understand `vim`, plugin APIs, and the active runtime path.

#### Treesitter

Treesitter loads for real file buffers. Bash and regular-expression parsers are
always ensured; other parsers are installed on the first corresponding
`FileType` event. Parser setup is skipped for transient interfaces such as
completion menus, help, quickfix, Lazy, Mason, Noice, notifications, LSP info,
and Snacks picker buffers.

#### Harpoon

Harpoon 2 saves changes to its list automatically while leaving branch-specific
marks and automatic UI-close synchronization disabled. Slots one through eight
are selected with `;1` through `;8`. Harpoon is not enabled inside VS Code.

#### Markdown and wiki editing

`markdown-preview.nvim` loads for `markdown` and `wiki` buffers and builds its
web application with `yarn install`. Wiki and journal commands are provided by
`wiki.vim` plus the local `vim-bundle-wiki.vim` customizations. Bullets and
checkboxes are active for Markdown, wiki, text, scratch, and Git commit buffers;
`;x` toggles a checkbox.

`img-clip.nvim` stores pasted images beneath `images/<document-name>/`, prompts
for the filename, URL-encodes paths, and inserts filetype-specific markup for
Markdown, wiki, AsciiDoc, HTML, Org, reStructuredText, TeX, and Typst. It is
disabled on Windows.

#### todo-comments.nvim

In addition to the standard keywords, todo-comments recognizes:

- `YouTube`, `Youtube`, and `youtube` with a red YouTube icon.
- `URL`, `Url`, and `url` with a purple link icon.

Keyword sets are merged with the defaults and matches are highlighted even when
they appear outside comments.

#### Git and search

Fugitive loads on `:G`; Gitsigns supplies buffer signs and hunk operations, and
Snacks supplies repository pickers and browser integration. `grug-far.nvim`
provides project-wide search and replacement. Better Quickfix adds a preview
window whose borders follow the configuration's purple highlight palette.

#### UI

TokyoNight uses its transparent `night` style with italic comments and keywords,
transparent sidebars and floats, a hidden inactive statusline, bold Lualine, and
purple borders. Noice renders the command line in a popup, sends ordinary
messages through notifications, exposes long messages in a split, and filters
routine editor noise. Lualine includes Git state, diagnostics, macro recording,
Noice command/search status, file metadata, and cursor position. Which-key uses
its modern preset with spelling suggestions.

### LSP configuration and installation

The LSP stack is composed of three plugins:

- `nvim-lspconfig` supplies server definitions compatible with Neovim's native
  LSP configuration API.
- `mason.nvim` installs language-server executables in Neovim's data directory.
- `mason-lspconfig.nvim` translates LSP server names into Mason packages.

Servers are installed and configured by filetype rather than eagerly at
startup. On the first matching `FileType` event, the configuration:

1. Looks up the server in `lua/traap/lsp/servers.lua`.
2. Skips setup when that server was already handled during the session.
3. Asks Mason to ensure the package is installed unless `mason = false`.
4. Merges Blink completion capabilities and the format-on-save attachment hook
   with the server-specific options.
5. Configures and enables the server through `vim.lsp.config()` and
   `vim.lsp.enable()`; a legacy `lspconfig.setup()` fallback remains available.

The first visit to a filetype may initiate a Mason installation. Open another
buffer of that type or run `:LspStart` after installation finishes if the
executable was not available when Neovim first attempted to start it.

The registry currently supports:

| Languages | Servers |
| --- | --- |
| Bash, C/C++, C#, CSS | `bashls`, `clangd`, `csharp_ls`, `cssls` |
| Go, HTML, Java, JSON | `gopls`, `html`, `jdtls`, `jsonls` |
| Julia, LaTeX prose, Lua, Markdown | `julials`, `ltex`, `lua_ls`, `marksman` |
| Nix, Python, QML, Ruby | `nixd`, `pyright`, `qmlls`, `solargraph` |
| Rust, SQL, Svelte, TeX | `rust_analyzer`, `sqls`, `svelte`, `texlab` |
| TOML, JavaScript/TypeScript, Vim, XML, YAML, Zig | `taplo`, `ts_ls`, `vimls`, `lemminx`, `yamlls`, `zls` |

Solargraph is explicitly excluded from Mason management and is deliberately
launched with:

```text
mise exec ruby@4.0.0 -- solargraph stdio
```

`nixd` is expected to exist on `PATH`. If it is unavailable through the active
Mason registry, its server entry should also use `mason = false`. The Lua server
knows the complete Neovim runtime library and accepts `vim` and `Snacks` as
globals. Clangd enables background indexing and clang-tidy, requests detailed
completion, and suppresses automatic header insertion.

When a client supports `textDocument/formatting`, a buffer-local `BufWritePre`
hook formats synchronously. The current LSP hook does not consult the
`vim.b.autoformat` flag used elsewhere in the configuration.

Native LSP mappings are installed when a client attaches:

| Mapping | Action |
| --- | --- |
| `gd` / `gD` | Definition / declaration. |
| `gi` / `gr` | Implementation / references. |
| `K` / `<leader>k` | Hover / signature help. |
| `<leader>rn` | Rename symbol. |
| `<leader>ca` | Code action. |
| `<leader>E` | Open diagnostic float. |
| `[d` / `]d` | Previous / next diagnostic. |
| `<leader>q` | Populate the location list with diagnostics. |

LSP maintenance commands:

| Command | Purpose |
| --- | --- |
| `:LspInfo` | Run `:checkhealth vim.lsp`. |
| `:LspLog` | Open the Neovim LSP log in a tab. |
| `:LspStart [server...]` | Enable named servers, or the server for the current filetype. |
| `:LspRestart[!] [server...]` | Restart named or active servers; `!` force-stops clients. |
| `:LspStop[!] [server...]` | Disable named or active servers; `!` force-stops clients. |

To add or change a language server, edit
`lua/traap/lsp/servers.lua`. Each registry entry requires a native LSP server
`name` and one or more `filetypes`. Add `opts` for server-specific settings or a
custom command. Set `mason = false` when the executable is installed outside
Mason.

```lua
example = {
  name = "example_ls",
  filetypes = { "example" },
  opts = {
    settings = { example = { enabled = true } },
  },
}
```

### Platform behavior

Standalone Neovim receives the complete UI, completion, LSP, Treesitter, Git,
Harpoon, and content-authoring stack. VS Code receives a reduced plugin list and
routes selected editor actions to VS Code commands. Platform helpers also adapt
clipboard behavior for SSH and Windows and allow picker navigation to cross
Neovim/tmux boundaries.

### Validation and maintenance

After changing the configuration, useful checks are:

```bash
nvim --headless "+Lazy! sync" "+qa"
nvim --headless "+checkhealth" "+qa"
stylua --check init.lua lua
```

Within Neovim, use `:Lazy profile` to inspect startup behavior, `:Mason` to
inspect installed language servers, and `:LspInfo` from a source buffer to
confirm that its client attached.
