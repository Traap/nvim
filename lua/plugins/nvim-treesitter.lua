Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  "nvim-treesitter/" .. plugin,
  enabled = Is_Enabled(plugin),

  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = require("plugins.opts.nvim-treesitter")
    end
  end,

  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
  },
}
