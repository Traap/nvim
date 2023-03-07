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
  -- {{{ nvim-lspconfig

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    enabled = Is_Enabled("nvim-lspconfig"),
    opts = function(_, opts)
      opts.servers = {
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
