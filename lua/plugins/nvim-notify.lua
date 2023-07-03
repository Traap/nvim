Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  "rcarriga/nvim-notify",
  enabled = Is_Enabled("nvim-notify"),
  opts = function(_, opts)
    if Use_Defaults("nvim-notify") then
      opts = opts
    else
      opts.background_colour = "#1a1b26"
      opts.timeout = 1000
      opts.top_down = false
    end
  end,
}
