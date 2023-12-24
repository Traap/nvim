--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.ruby" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "traap.plugins.colorscheme" },
    { import = "traap.plugins.ui" },
    { import = "traap.plugins.util" },
    { import = "traap.plugins.tmux" },
    { import = "traap.plugins.finder" },
    { import = "traap.plugins.syntax" },
    { import = "traap.plugins.cmp" },
    -- { import = "traap.plugins.dap" },
    { import = "traap.plugins.disabled" },
  },

  defaults = {
    lazy = true,
    version = false,
    autocmds = true,
    keymaps = false,
  },

  install = { colorscheme = { "tokyonight", "habamax" } },

  checker = { enabled = true },

  change_detection = {
    enable = true,
    notify = false,
  },

  performance = {
    cache = { enabled = true, },
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "syntax",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },

  ui = {
    border = "rounded",
    title = "lazy.nvim",
  },
})
