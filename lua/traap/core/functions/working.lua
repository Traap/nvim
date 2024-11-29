-- Am I using Neovim @home or @work?

local M = {}

function M.at_home()
  local host = os.getenv('HOSTNAME') ~= nil
  local hostnames = {'DarkNight', 'Ninja', 'Zero'}
  for _, hostname in ipairs(hostnames) do
    if hostname == host then
      return true
    end
  end
  return false
end

return M
