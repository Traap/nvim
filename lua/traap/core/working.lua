-- Am I using Neovim @home or @work?

local M = {}

function M.at_home()
  local host = vim.uv.os_gethostname()
  local hostnames = {'DarkNight', 'Ninja', 'Zero'}
  for _, hostname in ipairs(hostnames) do
    if hostname == host then
      return true
    end
  end
  return false
end

function M.whosePlugins()
  if not pcall(require, "lazyvim") then
    require("notify")("LazyVim plugins are NOT used.", "info", {title="Configuraiton Notice"})
 else
    require("notify")("LazyVim plugins ARE used.", "info", {title="Configuraiton Notice"})
  end
end

function M.hostname()
  Snacks.notify.info(vim.uv.os_gethostname(), {title="Startup: nvim.traap 1"})
end

return M
