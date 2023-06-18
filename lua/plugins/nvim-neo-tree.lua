Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "neo-tree.nvim"

return {
  "nvim-neo-tree/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = false,
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.filesystem = { bind_to_cwd = false, follow_current_file = true, }
      opts.window = { position = "right", }
    end
  end,
}
