require("traap.core.globals")

local plugin = "neo-tree.nvim"

return {
  "nvim-neo-tree/" .. plugin,
  enabled = Is_Enabled(plugin),

  keys = {
    {"<c-n>", "<cmd>Neotree toggle<cr>"},
    {"<c-nf>", "<cmd>Neotree focus<cr>"},
  },

  opts = function(_, opts)
    opts.filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true}
    }
    opts.window = { position = "right", }
  end,

  dependencies = {
  }
}
