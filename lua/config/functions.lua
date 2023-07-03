Customzie = require("config.customize")
local M = {}

-- {{{ keymap helper

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Boolean helpers

local function _error_handler(err)
  require("notify")(err)
end

local function _is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    require("notify")("is_enabled could not find " .. plugin)
  end
  return status and enabled
end

function M.is_debugger(debugger)
  return require("config.debuggers").Debuggers[debugger].enabled
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_default_opts(plugin)
  return Customize.plugins[plugin].defaults or false
end

function M.use_default_config(plugin)
  return Customize.plugins[plugin].config or false
end

function M.use_defaults_keys(plugin)
  return Customize.plugins[plugin].keys or false
end

-- ------------------------------------------------------------------------- }}}

return M
