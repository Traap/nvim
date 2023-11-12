-- Set em' first! Things might go sideways while I'm configuring Neovim
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Use my bootstrap method.  Then hand things over to Lazy.
require("traap.core.bootstrap")

-- My setup.
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")

--  Minimzl lazy setup.
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
})
vim.cmd("colorscheme tokyonight-night")
