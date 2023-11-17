local Lsp = {}
-- {{{ Lsp Configuration Options

Lsp = {
  opts = {
    servers = {
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
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          completion = {
            workspaceWord = true,
            callmSnippet = "Both",
          },
          misc = {
            parameters = { "--log-level=trace", },
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

    handlers = {
      require("lsp-zero").default_setup,
    },
  },
}

-- ------------------------------------------------------------------------- }}}
return Lsp
