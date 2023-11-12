require("traap.core.globals")

local plugin = "conform"
return {
  "stevearc/" .. plugin .. ".nvim",
  enabled = Is_Enabled(plugin..".nvim"),

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("conform").setup({
      formatters_by_ft  = {
        lua             = { "stylua" },
        svelte          = { { "prettierd", "prettier" } },
        javascript      = { { "prettierd", "prettier" } },
        typescript      = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json            = { { "prettierd", "prettier" } },
        graphql         = { { "prettierd", "prettier" } },
        java            = { "google-java-format" },
        kotlin          = { "ktlint" },
        ruby            = { "standardrb" },
        markdown        = { { "prettierd", "prettier" } },
        erb             = { "htmlbeautifier" },
        html            = { "htmlbeautifier" },
        bash            = { "beautysh" },
        proto           = { "buf" },
        rust            = { "rustfmt" },
        yaml            = { "yamlfix" },
        toml            = { "taplo" },
        css             = { { "prettierd", "prettier" } },
        scss            = { { "prettierd", "prettier" } },
      },
    })

    vim.keymap.set("n", "<leader>L", "<cmd>lua vim.lsp.buf.format()<CR>")
  end,
}
