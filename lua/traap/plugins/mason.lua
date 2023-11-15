return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  enabled = true,
  keys = { { "<leader>cm", "<cmd>Mason<cr> " }},

  opts = function(_, opts)
    opts.ensure_installed = {
      "bash-language-server",
      "clangd",
      "css-lsp",
      "emmet-ls",
      "eslint-lsp",
      "flake8",
      "gopls",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "omnisharp",
      "pyright",
      "rust-analyzer",
      "shellcheck",
      "shfmt",
      "solargraph",
      "sqlls",
      "stylua",
      "texlab",
      "typescript-language-server",
      "yaml-language-server",
    }
  end,

  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup()
  end,
}
