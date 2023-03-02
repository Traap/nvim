local M = {}

function M.keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	options = vim.tbl_deep_extend("force", options, opts or {})
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- M.lsp_ensure_installed = function()
--   local ensure_installed = {}
--   for _, value in pairs(require('config.constants').lsp_to_mason) do
--     table.insert(ensure_installed, value.lsp)
--   end
--   return ensure_installed
-- end

return M
