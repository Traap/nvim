Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "nvim-lightbulb"

return {
  "kosayoda/" .. plugin,
  event = "BufReadPre",
  enabled = Is_Enabled(plugin),
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.autocmd = { enabled = true }
    end
  end,
}
