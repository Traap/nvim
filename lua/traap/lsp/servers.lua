local lsp_zero = require("lsp-zero")

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup Mason and Mason-Config.
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

-- Lsp popups use borders.
require('lspconfig.ui.windows').default_options.border = 'single'
