local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = Is_Enabled("mason-nvim-dap.nvim"),
  event = Constants.file_types,
  opts = function(_, opts)
    if Use_Defaults("mason-nvim-dap.nvim") then
      opts = opts
    else
      opts.automatic_setup = true
      opts.ensure_installed = Constants.ensure_installed.dap
    end
  end,
}
