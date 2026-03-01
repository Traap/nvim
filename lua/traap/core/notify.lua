local M = {}

M.verbose = false

local default_notify = vim.notify

local function is_verbose()
  local verbose = vim.uv.os_getenv("NVIM_VERBOSE")
  return verbose and verbose ~= "false" and verbose ~= "0"
end

local function _notify(message, level)
  if (level == vim.log.levels.INFO or level == vim.log.levels.DEBUG)
      and not M.verbose then
    return
  end
  default_notify(message, level)
end

function M.notify(msg, level, title)
  if not is_verbose() then
    return
  end
  local ok, n = pcall(require, "notify")
  if ok then
    n(msg, level, { title = title })
  else
    vim.notify(msg, level, { title = title })
  end
end

function M.notify_at_host(msg, level)
  local host = vim.uv.os_gethostname()
  local title = host .. " startup"
  M.notify(msg, level, title)
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

vim.api.nvim_create_user_command("VerboseOn", function()
  M.verbose = true
  default_notify("Verbose mode enabled", vim.log.levels.INFO, {})
end, {})

vim.api.nvim_create_user_command("VerboseOff", function()
  M.verbose = false
  default_notify("Verbose mode disabled", vim.log.levels.INFO, {})
end, {})

return M

