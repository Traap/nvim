local M = {}
local platform = require("traap.core.platform")
local notify = require("traap.core.notify")

function M.at_home()
  local host = platform.get_host()
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
    notify.notify_at_host("LazyVim plugins ARE used.", "warn")
  else
    notify.notify_at_host("LazyVim plugins are NOT used.", "info")
  end
end

function M.from()
  if platform.is_vscode() then
    return
  end

  if M.at_home() then
    notify.notify_at_host("Working home", "info")
  else
    notify.notify_at_host("Working remote", "info")
  end
end

return M
