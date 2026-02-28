-- Am I using Neovim @home or @work?
local M = {}
local platform = require("traap.core.platform")

local function get_host()
  return vim.uv.os_gethostname()
end

local function is_verbose()
  local verbose = vim.uv.os_getenv("NVIM_VERBOSE")
  return verbose and verbose ~= "false" and verbose ~= "0"
end

local function notify(msg, level, title)
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

local function notify_at_host(msg, level)
  local host = get_host()
  local title = host .. " startup"
  notify(msg, level, title)
end

function M.at_home()
  local host = get_host()
  local hostnames = { "DarkKnight", "DarkNight", "Ninja", "Zero" }

  for _, h in ipairs(hostnames) do
    if h == host then
      return true
    end
  end

  return false
end

function M.whosePlugins()
  if platform.is_vscode() then
    return
  end

  if pcall(require, "lazyvim") then
    notify_at_host("LazyVim plugins ARE used.", "warn")
  else
    notify_at_host("LazyVim plugins are NOT used.", "info")
  end
end

function M.from()
  if platform.is_vscode() then
    return
  end

  if M.at_home() then
    notify_at_host("Working home", "info")
  else
    notify_at_host("Working remote", "info")
  end
end

return M
