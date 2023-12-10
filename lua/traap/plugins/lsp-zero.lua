return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  enable = true,
  event = {"BufReadPost", "BufNewFile"},
  -- config = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },

  config = function()
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

    -- Lsp popups use borders.
    require('lspconfig.ui.windows').default_options.border = 'single'
  end
}
