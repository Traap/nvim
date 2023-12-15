local M = {}

function M.log_error(errorMessage)
  local log_file = io.open(os.getenv("HOME").."/neovim.log", 'a')
  if log_file then
    log_file:write(errorMessage .. "\n")
    log_file:close()
  else
    print("Error opening log file!")
  end
end

return M
