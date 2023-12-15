local M = {}

local function _error_handler(err)
  require("notify")(err)
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

return M
