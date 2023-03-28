Customzie = require("config.customize")
local M = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Youtube: Is this plugin enabled?
function M.is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

-- Youtube: Are we ready to debug?
function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

-- Youtube: Are we inside TMUX?
function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

-- Youtube: Use LazyVim defaults
function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

return M
