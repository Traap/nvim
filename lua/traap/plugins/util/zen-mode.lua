return {
  "folke/zen-mode.nvim",
  enabled = true,

  keys = {
    {"<leader>oz", [[<cmd>lua require("zen-mode").toggle()<cr>]], desc = "Zen mode" },
  },


  opts = {
    window = {
      width = 0.65,
      height = 0.85,
      options = {
        colorcolumn = "",
        cursorcolumn = false,
        cursorline = false,
        number = true,
        relativenumber = true,
      },
    },

    event = { "BufEnter *.rb" },
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
}
