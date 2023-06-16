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

local function _error_handler(err)
  require("notify")(err)
end

local function _is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    require("notify")("is_enabled could not find " .. plugin)
  end
  return status and enabled
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
-- function M.surround_selected_text()
--   -- Get current buffer.
--   local bufnr = vim.api.nvim_get_current_buf()

--   -- Get the start and end positions of the visual selection
--   local sline = vim.api.nvim_buf_get_mark(bufnr, "<")
--   local eline = vim.api.nvim_buf_get_mark(bufnr, ">")

--   -- NOTE: 1) Relativenumbers cause grief. 2) Marks seam to move around.  Values
--   -- reported trough etxt and stxt don't make sense.

--   local start = sline[1] - 1
--   local finish = eline[1] + 1

--   local etxt = { "-- finish: " .. finish }
--   vim.api.nvim_buf_set_lines(bufnr, finish, finish, false, etxt)

--   local stxt = { "-- start: " .. start }
--   vim.api.nvim_buf_set_lines(bufnr, start, start, false, stxt)
-- end

-- ------------------------------------------------------------------------- }}}

return M
