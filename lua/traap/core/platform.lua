local M = {}

function M.is_vscode()
  return vim.g.vscode ~= nil
end

function M.is_nvim()
  return not M.is_vscode()
end

function M.in_wsl()
  local uname = vim.loop.os_uname().release
  return uname:lower():find("microsoft") ~= nil
end

function M.is_wayland()
  return vim.env.WAYLAND_DISPLAY ~= nil
end

function M.is_git_bash()
  return vim.fn.has("win32") == 1 and vim.env.MSYSTEM ~= nil
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.get_host()
  return vim.uv.os_gethostname()
end

return M
