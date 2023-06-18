Customize = require("config.customize")
Constants = require("config.constants")
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
      opts.autopairs = { enable = true }
      opts.autotag = { enable = true, disable = { "xml" } }
      opts.context_commenting = { enable = true, enable_autocmd = false }
      opts.highlight = {
        enable = true,
        disable = Constants.disabled.treesitter,
        additional_vim_regex_highlighting = true,
      }
      opts.indent = { enable = true, disable = { "yml", "yaml" } }
      opts.rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1500,
        colors = Constants.colors.rainbow,
      }
      opts.disable = { "latex" }
      opts.ensure_installed = Constants.ensure_installed.treesitter
    end
  end,

  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
  },
}
