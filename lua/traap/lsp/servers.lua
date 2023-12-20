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
    "clangd",
    "emmet_ls",
    "gopls",
    "html",
    "jsonls",
    "lemminx",
    "lua_ls",
    "pyright",
    "rubocop",
    "rust_analyzer",
    "solargraph",
    "sqlls",
    "texlab",
    "tsserver",
    "yamlls",
  },

  automatic_installation = true,

  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

require("mason-tool-installer").setup({
  "prettier",
  "stylua",
  "sql-formatter",
})
