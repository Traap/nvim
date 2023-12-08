local M = {}

-- keymaps are silent and noremap by default
function M.keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  opts.noremap = opts.noremap ~= false
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
