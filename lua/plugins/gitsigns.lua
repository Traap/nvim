Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "gitsigns.nvim"

return {
  "lewis6991/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  -- ft = "gitcommit",

  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契"},
        topdelete = { text = "契"},
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      }
      opts.current_line_blame = true
      opts.current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>"
      opts.trouble = false
    end
  end,

  config = function(_, opts)
    require('gitsigns').setup(opts)
  end,
}
