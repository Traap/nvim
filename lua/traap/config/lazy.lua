--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins",
       opts = {
        defaults = { keymaps = false, },
        colorscheme = 'tokyonight',
      },
    },

    -- LazyVim plugins I Use.
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.ruby" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },

    -- LazyVim plugins I don't use.
    { import = "traap.plugins.disabled" },

    -- Now tell lazy.nvim about my customizations.
    { import = "traap.plugins.colorscheme" },
    { import = "traap.plugins.ui" },
    { import = "traap.plugins.util" },
    { import = "traap.plugins.terminal" },
    { import = "traap.plugins.wiki" },
    { import = "traap.plugins.finder" },
    { import = "traap.plugins.syntax" },
    { import = "traap.plugins.cmp" },
    { import = "traap.plugins.vimtex" },

    -- Now hookup unit testing.
    { import = "traap.plugins.utest" },
  },

  defaults = {
    lazy = true,
    version = false,
    autocmds = true,
    keymaps = false,
  },

  install = {
    missing = true,
    colorscheme = { "tokyonight", "habamax" }
  },

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
    size = { width = 0.75, height = 0.75 },
    border = "rounded",
    title = "lazy.nvim",
  },
})
