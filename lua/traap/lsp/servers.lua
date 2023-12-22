local lsp_zero = require("lsp-zero")

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup Mason and Mason-Config.
require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    border = "rounded",
  },

})

-- Setup mason-lspconfig.
require('mason-lspconfig').setup({
  ensure_installed = {
    "bashls",
    "charp_ls",
    "clangd",
    "emmet_ls",
    "gopls",
    "html",
    "java_language_server",
    "jsonls",
    "lemminx",
    "lua_ls",
    "pyright",
    "rust-analyzer",
    "solargraph",
    "sqlls",
    "texlab",
    "tsserver",
    "ymlls",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})
