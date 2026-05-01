local M = {}

---Return whether Neovim is running inside the VS Code extension host.
---@return boolean
function M.is_vscode()
  return vim.g.vscode ~= nil
end

---Return whether Neovim is running as standalone Neovim.
---@return boolean
function M.is_nvim()
  return not M.is_vscode()
end

---Return whether the current host is Windows Subsystem for Linux.
---@return boolean
function M.in_wsl()
  local uname = vim.uv.os_uname().release
  return uname:lower():find("microsoft") ~= nil
end

---Return whether the current desktop session is using Wayland.
---@return boolean
function M.is_wayland()
  return vim.env.WAYLAND_DISPLAY ~= nil
end

---Return whether the current shell environment is Git Bash on Windows.
---@return boolean
function M.is_git_bash()
  return vim.fn.has("win32") == 1 and vim.env.MSYSTEM ~= nil
end

---Return whether the current process is running inside tmux.
---@return boolean
function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

---Return the current hostname.
---@return string
function M.get_host()
  return vim.uv.os_gethostname()
end

---Return whether a lazy.nvim plugin exists and is enabled.
---@param name string lazy.nvim plugin name
---@return boolean
function M.has_plugin(name)
  local ok, config = pcall(require, "lazy.core.config")
  if not ok then
    return false
  end

  local plugin = config.plugins[name]
  return plugin ~= nil and plugin.enabled ~= false
end

---Load a lazy.nvim plugin by name when it is configured and enabled.
---@param name string lazy.nvim plugin name
---@return boolean
function M.load_plugin(name)
  if not M.has_plugin(name) then
    return false
  end

  local ok, lazy = pcall(require, "lazy")
  if not ok then
    return false
  end

  lazy.load({ plugins = { name } })
  return true
end

---Run a callback after a plugin has been loaded successfully.
---@param plugin_name string lazy.nvim plugin name
---@param fn fun()
function M.with_loaded_plugin(plugin_name, fn)
  if M.load_plugin(plugin_name) then
    fn()
  end
end

---Run a callback with a required Lua module after loading its plugin.
---@param plugin_name string lazy.nvim plugin name
---@param module_name? string Lua module name passed to require
---@param fn fun(mod?: unknown)
function M.with_plugin(plugin_name, module_name, fn)
  M.with_loaded_plugin(plugin_name, function()
    if not module_name then
      fn()
      return
    end

    local ok, mod = pcall(require, module_name)
    if ok then
      fn(mod)
    end
  end)
end

---Feed key input through Neovim's keycode translation.
---@param keys string
function M.input(keys)
  vim.api.nvim_input(vim.keycode(keys))
end

return M
