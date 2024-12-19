local M = {}

local function _log(message)
  local log_file = io.open(os.getenv("HOME").."/neovim.log", 'a')
  if log_file then
    log_file:write(message .. "\n")
    log_file:close()
  else
    print("Error opening log file!")
  end
end

M.debug = function(message)
  _log("[Debug] " .. message)
end

M.error = function(message)
  _log("[Error] " .. message)
end

M.info = function(message)
  _log("[Info] " .. message)
end

M.warn = function(message)
  _log("[Warn] " .. message)
end

return M
