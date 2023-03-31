Customzie = require("config.customize")
local M = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Youtube: Is this plugin enabled?
function M.is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

-- Youtube: Are we ready to debug?
function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

-- Youtube: Are we inside TMUX?
function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

-- Youtube: Use LazyVim defaults?
function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

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

return M
