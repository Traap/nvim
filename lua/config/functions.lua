Customzie = require("config.customize")

local M = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

function M.is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

return M
