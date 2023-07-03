local Constants = {}

-- {{{ Begin Constants table.  These are items used through out Neovim.

Constants = {

  -- ----------------------------------------------------------------------- }}}
  -- {{{ lua_ls settings

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Languages lsp_config, mason, and treesitter ensures are installed.

  ensure_installed = {
    lsp_config = {
      "bashls",
      "clangd",
      "cssls",
      "diagnosticls",
      "emmet_ls",
      "eslint",
      "gopls",
      "html",
      "jsonls",
      "lua_ls",
      "omnisharp",
      "pyright",
      "rust_analyzer",
      "solargraph",
      "sqlls",
      "texlab",
      "tsserver",
      "yamlls",
    },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Languages lsp_config, mason, and treesitter ensures are disabled.

  disabled = {
    lsp_config = {},
    mason = {},
    treesitter = {
      "css",
      "latex",
      "markdown",
    },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ File type events

  file_types = {
    "BufEnter *.c",
    "BufEnter *.cpp",
    "BufEnter *.cs",
    "BufEnter *.go",
    "BufEnter *.java",
    "BufEnter *.lua",
    "BufEnter *.py",
    "BufEnter *.rb",
    "BufEnter *.rs",
    "BufEnter *.ts",
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ icons

  icons = {
    dap = {
      expanded = "",
      collapsed = "",
      circular = "",
    },
    diagnostic = {
      Error = "",
      Hint = "",
      Info = "",
      Warn = "",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Display boarders

  display_border = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ keybinding options

  keybind_opts = {
    normal = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>", -- Override this value.
      buffer = nil, -- Global mappings. Specify a buffer number for buffer
      --   local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },

    visual = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>", -- Override this value.
      buffer = nil, -- Global mappings. Specify a buffer number for buffer
      -- local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ End Constants table.
}
-- ------------------------------------------------------------------------- }}}

return Constants
