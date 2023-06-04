local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "mason-nvim-dap.nvim"

return {
  "jay-babu/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = Constants.file_types,
  opts = function(_, opts)
      opts = opts
    if Use_Defaults(plugin) then
    else
      opts.automatic_setup = true
      opts.ensure_installed = Constants.ensure_installed.dap
    end
  end,
}
