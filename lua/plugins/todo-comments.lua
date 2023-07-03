Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "todo-comments.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.merge_keywords = true
      opts.keywords = {
        Youtube = { icon = " ", color = "#ff0000" },
        URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
      }
    end
  end,
}
