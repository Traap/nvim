Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "tokyonight.nvim"
return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.style = "night"
      opts.styles = { sidebars = "transparent", floats = "transparent", }
    end
  end,
}
