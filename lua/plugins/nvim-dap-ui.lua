Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = 'nvim-dap-ui'

return {
  "rcarriga/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = Constants.file_types,
  opts = require("plugins.opts." .. plugin),
  config = require("plugins.configs." .. plugin),
  dependencies = { "mfussenegger/nvim-dap" },
}
