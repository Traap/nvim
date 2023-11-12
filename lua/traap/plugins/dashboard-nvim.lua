require("traap.core.globals")

local plugin = "dashboard-nvim"

return {
  "nvimdev/" .. plugin,
  cmd = "Dashboard",
  key = {"<leader>aa", "<cmd>Dashboard<>"},
  enabled = Is_Enabled(plugin),

  config = function()
    require('dashboard').setup{ 
      -- config
    }
  end,

  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  }
}
