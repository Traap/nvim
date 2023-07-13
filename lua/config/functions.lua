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

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_default_opts(plugin)
  return Customize.plugins[plugin].default.opts or false
end

function M.use_default_config(plugin)
  return Customize.plugins[plugin].default.config or false
end

function M.use_default_keys(plugin)
  return Customize.plugins[plugin].default.keys or false
end

-- FIX: Parse pagename correctly.
function M.page_viewer()
  local bufnr = vim.api.nvim_get_current_buf()
  local pagename = vim.api.nvim_buf_get_name(bufnr)
  local command = "<cmd>!"..PDF_VIEWER.." "..os.getenv("WIKIHOME").."/printed/"..pagename..".pdf<cr>"
  M.log_error(command)
  return command
end


function M.log_error(errorMessage)
  local log_file = io.open("/home/traap/neovim.log", 'a')

  if log_file then
    log_file:write(errorMessage .. "\n")
    log_file:close()
  else
    print("Error opening log file!")
  end

end
-- ------------------------------------------------------------------------- }}}

return M
