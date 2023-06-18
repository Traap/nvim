Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "nvim-web-devicons"

return {
  "nvim-tree/" .. plugin,

  enabled = Is_Enabled(plugin) and
           (Is_Enabled("nvim-tree") or Is_Enabled("lualine.nvim")),

  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.override = Constants.icons.web_devicons
    end
  end,
}
