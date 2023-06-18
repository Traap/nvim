Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "nvim-base16"

return {
  "RRethy/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  priority = 1000,

  config = function()
    vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
  end,
}
