return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,

  keys = {
    {"<c-n>", "<cmd>Neotree toggle<cr>", "Neotree toggle"},
    {"<leader>nf", "<cmd>Neotree focus<cr>", "Neotree focus"},
  },

  opts = function(_, opts)
    opts.filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true}
    }
    opts.window = { position = "right", }
  end,

}
