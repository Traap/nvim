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
    dap = {
      "codelldb",
      "debugpy",
      "delve",
      "java-debug-adapter",
      "java-test",
      "js-debug-adapter",
      "netconfigdb",
      "node-debug2-adapter",
    },
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
    treesitter = {
      "bash",
      "c",
      "c_sharp",
      "cpp",
      "dockerfile",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "rust",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
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
    web_devicons = {
      Dockerfile = { icon = "", color = "#b8b5ff", name = "Dockerfile" },
      css = { icon = "", color = "#61afef", name = "css" },
      deb = { icon = "", color = "#a3b8ef", name = "deb" },
      html = { icon = "", color = "#DE8C92", name = "html" },
      jpeg = { icon = " ", color = "#BD77DC", name = "jpeg" },
      jpg = { icon = " ", color = "#BD77DC", name = "jpg" },
      js = { icon = "", color = "#EBCB8B", name = "js" },
      kt = { icon = "󱈙", color = "#ffcb91", name = "kt" },
      lock = { icon = "", color = "#DE6B74", name = "lock" },
      md = { icon = "", color = "#b8b5ff", name = "mp3" },
      mp3 = { icon = "", color = "#C8CCD4", name = "mp3" },
      mp4 = { icon = "", color = "#C8CCD4", name = "mp4" },
      out = { icon = "", color = "#C8CCD4", name = "out" },
      png = { icon = " ", color = "#BD77DC", name = "png" },
      py = { icon = "", color = "#a7c5eb", name = "py" },
      rb = { icon = "", color = "#ff75a0", name = "rb" },
      rpm = { icon = "", color = "#fca2aa", name = "rpm" },
      toml = { icon = "", color = "#61afef", name = "toml" },
      ts = { icon = "ﯤ", color = "#519ABA", name = "ts" },
      vue = { icon = "﵂", color = "#7eca9c", name = "vue" },
      xz = { icon = "", color = "#EBCB8B", name = "xz" },
      yaml = { icon = "", color = "#EBCB8B", name = "xz" },
      zip = { icon = "", color = "#EBCB8B", name = "zip" },
    },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Rainbow colors

  colors = {
    rainbow = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Cornsilk",
      "Salmon",
      "LawnGreen",
    },
  },

  -- ----------------------------------------------------------------------- }}}
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
