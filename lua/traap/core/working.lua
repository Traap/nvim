-- Am I using Neovim @home or @work?
local M = {}

local function hostname()
  return vim.uv.os_gethostname()
end

local function notify(msg, level, title)
  -- If nvim-notify is installed and enabled, use it; otherwise fall back to vim.notify.
  local ok, n = pcall(require, "notify")
  if ok then
    n(msg, level, { title = title })
  else
    vim.notify(msg, level, { title = title })
  end
end

function M.at_home()
  local host = hostname()
  local hostnames = { "DarkKnight", "DarkNight", "Ninja", "Zero" }

  for _, h in ipairs(hostnames) do
    if h == host then
      return true
    end
  end

  return false
end

function M.whosePlugins()
  if vim.g.vscode then
    return
  end

  local host = hostname()
  local title = host .. " startup"

  if pcall(require, "lazyvim") then
    notify("LazyVim plugins ARE used.", "warn", title)
  else
    notify("LazyVim plugins are NOT used.", "info", title)
  end
end

function M.from()
  if vim.g.vscode then
    return
  end
  local host = hostname()
  local title = host .. " startup"

  if M.at_home() then
    notify(host .. " working home", "info", title)
  else
    notify(host .. " working remote", "info", title)
  end
end

return M
