Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "zen-mode.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),

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
