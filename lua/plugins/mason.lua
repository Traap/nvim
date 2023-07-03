Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

local plugin = "mason.nvim"

return {
  "williamboman/" .. plugin,
  cmd = "Mason",
  enabled = Is_Enabled("mason.nvim"),
  keys = { { "<leader>cm", "<cmd>Mason<cr> " }},
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
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
    end
  end,
}
