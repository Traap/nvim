Customzie = require("config.customize")
local M = {}

-- {{{ keymap helper

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Boolean helpers

function M.is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Surround selected text

-- TODO: This prototype is broken.
function M.surround_selected_text()
  -- Get current buffer.
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the start and end positions of the visual selection
  local sline = vim.api.nvim_buf_get_mark(bufnr, "<")
  local eline = vim.api.nvim_buf_get_mark(bufnr, ">")

  -- NOTE: 1) Relativenumbers cause grief. 2) Marks seam to move around.  Values
  -- reported trough etxt and stxt don't make sense.

  local start = sline[1] - 1
  local finish = eline[1] + 1

  local etxt = { "-- finish: " .. finish }
  vim.api.nvim_buf_set_lines(bufnr, finish, finish, false, etxt)

  local stxt = { "-- start: " .. start }
  vim.api.nvim_buf_set_lines(bufnr, start, start, false, stxt)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ User event
--     NOTE: Found in AstroNvim lua/utils/init.lua

--- Trigger an user event
---@param event string The event name to be appended to Traap
function M.event(event)
  vim.schedule(
    function()
      vim.api.nvim_exec_autocmds("User", { pattern = "Traap" .. event })
    end
  )
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell command
--     NOTE: Found in AstroNvim lua/utils/init.lua

--- Run a shell command and capture the output and if the command succeeded or failed
---@param cmd string The terminal command to execute
---@param show_error? boolean Whether or not to show an unsuccessful command as an error to the user
---@return string|nil # The result of a successfully executed command or nil
function M.cmd(cmd, show_error)
  local wind32_cmd
  if vim.fn.has "win32" == 1 then wind32_cmd = { "cmd.exe", "/C", cmd } end
  local result = vim.fn.system(wind32_cmd or cmd)
  local success = vim.api.nvim_get_vvar "shell_error" == 0
  if not success and (show_error == nil or show_error) then
    vim.api.nvim_err_writeln("Error running command: " .. cmd .. "\nError message:\n" .. result)
  end
  return success and result:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "") or nil
end

return M
