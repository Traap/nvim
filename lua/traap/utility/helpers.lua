local vim = vim

local M  = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  -- if opts then options = vim.fn.extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
