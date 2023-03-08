Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ vim-bundler

  {
    "tpope/vim-bundler",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-bundler"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-bbye

  {
    "moll/vim-bbye",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-bbye"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-eunuch

  {
    "tpope/vim-eunuch",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-eunuch"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-fugitive

  {
    "tpope/vim-fugitive",
    -- lazy = false,
    event = "BufEnter",
    enabled = Is_Enabled("vim-fugitive"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rails

  {
    "tpope/vim-rails",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-rails"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rake

  {
    "tpope/vim-rake",
    event = { "BufEnter *.rb", "BufEnter Rakefile" },
    enabled = Is_Enabled("vim-rake"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-rbven

  {
    "tpope/vim-rbenv",
    event = { "BufEnter *.rb" },
    enabled = Is_Enabled("vim-rbenv"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ toggleterm.nvim

  {
    "akinsho/toggleterm.nvim",
    enabled = Is_Enabled("toggleterm.nvim"),
    version = "*",
    opts = {
      size = 13,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = "1",
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
    },
    keys = {
      {
        "<leader>Tf",
        "<leader>Tl",
        "<leader>Tr",
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ zen-mode.nvim

  {
    "folke/zen-mode.nvim",
    enabled = Is_Enabled("zen-mode.nvim"),
    opts = {
      window = {
        width = 0.5,
        height = 0.85,
        options = {
          colorcolumn = "",
          cursorcolumn = false,
          cursorline = false,
          number = true,
          relativenumber = true,
        },
      },
      plugins = {
        enabled = true,
        options = {
          ruler = false,
          showmd = true,
        },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        alacritty = {
          enabled = true,
          font = "15",
        },
      },
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
