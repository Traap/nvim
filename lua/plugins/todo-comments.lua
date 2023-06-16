Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

local plugin = "todo-comments.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = Constants.icons.keywords
  end
}
