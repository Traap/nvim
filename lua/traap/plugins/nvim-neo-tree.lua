return {
  "nvim-neo-tree/neo-tree.nvim",
  enable = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },

  keys = {
    {"<c-n>", "<cmd>Neotree toggle<cr>"},
    {"<leader>nf", "<cmd>Neotree focus<cr>"},
  },

  opts = function(_, opts)
    opts.filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true}
    }
    opts.window = { position = "right", }
  end,

}
