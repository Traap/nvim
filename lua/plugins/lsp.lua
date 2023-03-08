Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ mason.nvim

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    enabled = Is_Enabled("mason.nvim"),
    keys = { { "<leader>cm", "<cmd>Mason<cr> " } },
    opts = {
      ensure_installed = Constants.ensure_installed.mason,
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-lspconfi

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    enabled = Is_Enabled("nvim-lspconfig"),
    opts = function(_, opts)
      opts.servers = {
        ansiblels = {},
        astro = {},
        bashls = {},
        clangd = {},
        cssls = {},
        denols = false,
        dockerls = {},
        gopls = {},
        html = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        svelte = {},
        tsserver = {},
        yamlls = {},

        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              diagnostics = {
                enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      }
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
