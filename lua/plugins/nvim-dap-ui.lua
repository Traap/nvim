local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

-- {{{ nvim-dap-ui

return {
  "rcarriga/nvim-dap-ui",
  enabled = Is_Enabled("nvim-dap-ui"),
  event = Constants.file_types,
  opts = require("plugins.opts.nvim-dap-ui"),
  config = require("plugins.configs.nvim-dap-ui"),
  dependencies = { "mfussenegger/nvim-dap" },
}

-- ----------------------------------------------------------------------- }}}
