return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  dependencies = {
    "williamboman/mason.nvim",
    "rshkarin/mason-nvim-lint",
  },
  config = function()
    local servers = require("traap.config.servers")
    local linters = servers.linters_for_mason()

    require("mason-nvim-lint").setup({
      ensure_installed = linters,
    })

    local lint = require("lint")

    lint.linters_by_ft = {
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      dockerfile = { "hadolint" },
      go = { "golangci-lint" },
      html = { "tidy" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      json = { "jsonlint" },
      jsonc = { "jsonlint" },
      lua = { "luacheck" },
      markdown = { "markdownlint" },
      markdown_inline = { "markdownlint" },
      python = { "flake8" },
      ruby = { "rubocop" },
      sql = { "sqlfluff" },
      toml = { "taplo" },
      tsx = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vim = { "vint" },
      xml = { "xmllint" },
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
