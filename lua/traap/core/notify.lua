local M = {}

M.verbose = false

-- keep reference to original notify
local default_notify = vim.notify

local function _notify(message, level)
  -- suppress INFO and DEBUG when not verbose
  if (level == vim.log.levels.INFO or level == vim.log.levels.DEBUG)
      and not M.verbose then
    return
  end
  default_notify(message, level)
end

M.debug = function(message)
  _notify(message, vim.log.levels.DEBUG)
end

M.error = function(message)
  _notify(message, vim.log.levels.ERROR)
end

M.info = function(message)
  _notify(message, vim.log.levels.INFO)
end

M.warn = function(message)
  _notify(message, vim.log.levels.WARN)
end

-- helper commands to toggle verbosity
vim.api.nvim_create_user_command("VerboseOn", function()
  M.verbose = true
  default_notify("Verbose mode enabled", vim.log.levels.INFO, {})
end, {})

vim.api.nvim_create_user_command("VerboseOff", function()
  M.verbose = false
  default_notify("Verbose mode disabled", vim.log.levels.INFO, {})
end, {})

return M

