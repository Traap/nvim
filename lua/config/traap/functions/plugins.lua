Customzie = require("config.traap.customize")
local M = {}

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

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_default_opts(plugin)
  return Customize.plugins[plugin].default.opts or false
end

function M.use_default_config(plugin)
  return Customize.plugins[plugin].default.config or false
end

function M.use_default_keys(plugin)
  return Customize.plugins[plugin].default.keys or false
end

return M
