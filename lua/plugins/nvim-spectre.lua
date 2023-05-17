Is_Enabled = require("config.functions").is_enabled

local plugin = "nvim-spectre"

return {
  "nvim-pack/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Replace in files (Spectre)",
    },
  },
}
