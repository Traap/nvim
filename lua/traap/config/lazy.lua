--  Traap's personal Lazy setup.

require("lazy").setup({
  spec = {
    { import = "traap.plugins.colorscheme" },
    { import = "traap.plugins.ui" },
    { import = "traap.plugins.util" },
    { import = "traap.plugins.tmux" },
    { import = "traap.plugins.finder" },
    { import = "traap.plugins.syntax" },
    { import = "traap.plugins.lsp" },
    { import = "traap.plugins.cmp" },
    { import = "traap.plugins.dap" },
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
