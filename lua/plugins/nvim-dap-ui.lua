local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

-- {{{ nvim-dap-ui

local plugin = 'nvim-dap-ui'

return {
  "rcarriga/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = Constants.file_types,
  opts = require("plugins.opts." .. plugin),
  config = require("plugins.configs." .. plugin),
  dependencies = { "mfussenegger/nvim-dap" },
}

-- ----------------------------------------------------------------------- }}}
