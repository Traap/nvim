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
    mason = {
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
    lsp_kinds = {
      Class = "",
      Color = "",
      Constant = "",
      Constructor = "",
      Enum = "",
      EnumMember = "",
      Event = "",
      Field = "",
      File = "",
      Folder = "",
      Function = "",
      Interface = "",
      Keyword = "",
      Method = "",
      Module = "",
      Operator = "",
      Property = "",
      Reference = "",
      Snippet = " ",
      Struct = "",
      Text = "",
      TypeParameter = "",
      Unit = "",
      Value = "",
      Variable = "",
      buffer = "﬘ ",
      calc = " ",
      nvim_lsp = " ",
      path = " ",
      spell = " ",
      vsnip = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    keywords = {
      Youtube = { icon = " ", color = "#ff0000" },
      URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
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
  -- {{{ Completion source mapping

  completion = {
    source_mapping = {
      buffer = "[Buffer]",
      latex_symbols = "[LaTeX]",
      luasnip = "[Snippet]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      path = "[Path]",
      spell = "[Spell]",
    },

    sources = {
      { name = "buffer", keyword_length = 2, max_item_count = 30 },
      { name = "calc", keyword_length = 2, max_item_count = 30 },
      { name = "latex_symbols", keyword_length = 1, max_item_count = 30 },
      { name = "luasnip", keyword_length = 1, max_item_count = 30 },
      { name = "nvim_lsp", keyword_length = 2, max_item_count = 30 },
      { name = "nvim_lua", keyword_length = 1, max_item_count = 30 },
      { name = "path", keyword_length = 3, max_item_count = 30 },
      { name = "spell", keyword_length = 2, max_item_count = 30 },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ End Constants table.
}
-- ------------------------------------------------------------------------- }}}

return Constants
