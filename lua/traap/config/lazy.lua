--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {

    { "LazyVim/LazyVim", import = "lazyvim.plugins",
      opts = require("traap.config.lazyvim").opts
    },

    -- lazyvim plugins i use.
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.dap.core" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.clangd" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.go" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.json" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.python" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.ruby" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.rust" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.tailwind" },
    { "lazyvim/lazyvim", import = "lazyvim.plugins.extras.lang.typescript" },

    -- Now tell lazy.nvim about my customizations.
    { import = "traap.plugins",
      opts = require("traap.config.lazyvim").opts
    },
  },

  defaults = {
    lazy = true,
    version = false,
    autocmds = true,
    keymaps = false,
  },

  checker = { enabled = false },

  change_detection = {
    enable = false,
    notify = false,
  },

  install = {
    missing = true,
    colorscheme = { "tokyonight", "darkplus", "default" }
  },


  ui = {
    size = { width = 0.75, height = 0.75 },
    border = "rounded",
    title = "lazy.nvim",
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
})
