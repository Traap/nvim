local lsp_zero = require("lsp-zero")

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})

local Lsp = require("traap.lsp.opts")
require("mason-lspconfig").setup(Lsp.opts)

-- Configure lua_ls
local lua_opts = lsp_zero.nvim_lua_ls()
require("lspconfig").lua_ls.setup(lua_opts)
