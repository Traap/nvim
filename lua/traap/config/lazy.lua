--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {
    { import = "traap.plugins" },
  },

  defaults = {
    lazy = true,
    version = false,
    autocmds = false,
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
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  ui = {
    border = "rounded",
    title = "lazy.nvim",
  },
})
