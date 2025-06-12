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
  if pcall(require, "lazyvim") then
    require("notify")("LazyVim plugins ARE used.",
                      "warn",
                      { title = vim.uv.os_gethostname() .. " startup" })
  else
    require("notify")("LazyVim plugins are NOT used.",
                      "info",
                      { title = vim.uv.os_gethostname() .. " startup" })
  end
end

function M.hostname()
  require("notify")(vim.uv.os_gethostname(),
                    "info",
                    { title = vim.uv.os_gethostname() .. " startup" })
end

return M
