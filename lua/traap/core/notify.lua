local M = {}

local function _notify(message, level)
  vim.notify(message, level)
end

M.debug = function(message)
  _notify("[Debug] " .. message, vim.log.levels.INFO)
end

M.error = function(message)
  _notify("[Error] " .. message, vim.log.levels.ERROR)
end

M.info = function(message)
  _notify("[Info] " .. message, vim.log.levels.INFO)
end

M.warn = function(message)
  _notify("[Warn]" .. message, vim.log.levels.WARN)
end

return M
