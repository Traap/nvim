--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {
    -- LazyVim plugins.
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins",
    --   opts = require("traap.config.lazyvim").opts
    -- },

    -- Now tell lazy.nvim about my customizations.
    { import = "traap.plugins",
      opts = require("traap.config.lazyvim").opts
    },


  },

  build = { warn_on_override = true, },

  checker = { enabled = false },

  change_detection = {
    enable = false,
    notify = false,
  },

  defaults = {
    lazy = true,
    version = false,
    autocmds = true,
    keymaps = false,
  },

  install = {
    missing = true,
    colorscheme = { "tokyonight", "darkplus", "default" }
  },

  performance = {
    cache = { enabled = true, },
    reset_packpath = true,
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
