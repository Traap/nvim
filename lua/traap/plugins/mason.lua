return {
  "williamboman/mason.nvim",
  enable = true,
  event = {"BufReadPost", "BufNewFile"},

  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
  },

  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", "Mason toggle" },
  },

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        border = "rounded",
      },
      ensure_installed = {
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
      },
    })
  end,
}
