local M = {}

function M.is_vscode()
  return vim.g.vscode ~= nil
end

function M.is_nvim()
  return not M.is_vscode()
end

return M
