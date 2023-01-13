-- DAP -Python

-- Set a formatter.
-- local formatters = require "lvim.nfsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
-- }

-- -- Set a linter.
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
-- }

-- Setup dap for python
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  -- require("dap-python").setup("python")
end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function()
  require("dap-python").test_runner = "pytest"
end)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    local keymap = require('traap.core.functions').keymap
    keymap('n', 'df', [[<cmd>lua require('dap-python').test_class()<cr>]])
    keymap('n', 'dm', [[<cmd>lua require('dap-python').test_method()<cr>]])
    keymap('n', 'ds', [[<cmd>lua require('dap-python').debug_selection()<cr>]])
  end,
})
