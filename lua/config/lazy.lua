-- {{{ My personal Lazy setup.

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },

  defaults = {
    lazy = true,
    version = false,
  },

  install = { colorscheme = { "tokyonight", "habamax" } },

  checker = { enabled = true },

  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
