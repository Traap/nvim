return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  event = require("traap.config.events").file,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    {"<leader>e", "<cmd>Neotree toggle<cr>", "Neotree toggle"},
  },

  opts = function(_, opts)
    opts.filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true}
    }
    opts.window = { position = "right", }
  end,

}
