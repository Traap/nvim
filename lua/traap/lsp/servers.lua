local M = {}
-- {{{ File types to LSP Server names

M.filetype_to_server = {
  bash = {
    name = 'bashls',
    filetypes = {
      'sh',
      'bash',
      'zsh',
    },
  },

  csharp = {
    name = 'csharp_ls',
    filetypes = {
      'cs',
      'vb',
      'c_sharp',
    },
  },

  cpp = {
    name = 'clangd',
    filetypes = {
      'c',
      'cpp',
      'objc',
      'objcpp',
    },
    opts = {
      cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--completion-style=detailed',
        '--header-insertion=never',
      },
    },
  },

  css = {
    name = 'cssls',
    filetypes = {
      'css',
      'less',
      'scss',
    },
  },

  go = {
    name = 'gopls',
    filetypes = {
      'go',
      'gomod',
    },
  },

  html = {
    name = 'html',
    filetypes = {
      'html',
    },
  },

  java = {
    name = 'jdtls',
    filetypes = {
      'java',
    },
  },

  json = {
    name = 'jsonls',
    filetypes = {
      'json',
      'jsonc',
    },
  },

  julia = {
    name = 'julials',
    filetypes = {
      'julia',
    },
  },

  latex = {
    name = 'ltex',
    filetypes = {
      'latex',
    },
  },

  lua = {
    name = 'lua_ls',
    filetypes = {
      'lua',
    },
    opts = function()
      return {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim', 'Snacks' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
          },
        },
      }
    end,
  },

  markdown = {
    name = 'marksman',
    filetypes = {
      'markdown',
    },
  },

  nix = {
    name = 'nixd',
    filetypes = {
      'nix',
    },
  },

  python = {
    name = 'pyright',
    filetypes = {
      'python',
    },
  },

  ruby = {
    name = 'solargraph',
    filetypes = {
      'ruby',
    },
    mason = false,
    opts = {
      cmd = { 'mise', 'exec', 'ruby@4.0.0', '--', 'solargraph', 'stdio' },
    },
  },

  rust = {
    name = 'rust_analyzer',
    filetypes = { 'rust' },
  },

  sql = {
    name = 'sqls',
    filetypes = {
      'sql',
    },
  },

  svelte = {
    name = 'svelte',
    filetypes = {
      'svelte',
    },
  },

  tex = {
    name = 'texlab',
    filetypes = {
      'bib',
      'tex',
    },
  },

  toml = {
    name = 'taplo',
    filetypes = {
      'toml',
    },
  },

  typescript = {
    name = 'ts_ls',
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
  },

  vim = {
    name = 'vimls',
    filetypes = {
      'vim',
    },
  },

  xml = {
    name = 'lemminx',
    filetypes = {
      'xml',
    },
  },

  yaml = {
    name = 'yamlls',
    filetypes = {
      'yaml',
      'yml',
    },
  },

  zig = {
    name = 'zls',
    filetypes = {
      'zig',
    },
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Linter names to filetypes

M.linter = {
  eslint = {
    name = 'eslint-lsp',
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
  },

  shellcheck = {
    name = 'shellcheck',
    filetypes = {
      'sh',
    },
  },

  flake8 = {
    name = 'flake8',
    filetypes = {
      'python',
    },
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Formatter names to filetypes

M.formatter = {
  shfmt = {
    name = 'shfmt',
    filetypes = {
      'bash',
      'sh',
    },
  },

  stylua = {
    name = 'stylua',
    filetypes = {
      'lua',
    },
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Debug adapters

M.debugger = {}

-- ------------------------------------------------------------------------- }}}
-- {{{ Return filetypes associated LSP servers.

M.filetypes_for_lsp_servers = function()
  local filetypes = {}

  for _, server in pairs(M.filetype_to_server) do
    for _, ft in ipairs(server.filetypes) do
      table.insert(filetypes, ft)
    end
  end

  return filetypes
end

-- --------------------------------------------------------------------------}}}
-- {{{ Return filetype to LSP server name mapping.

M.filetype_to_lsp_server = function()
  local filetypes = {}

  for _, server in pairs(M.filetype_to_server) do
    for _, ft in ipairs(server.filetypes) do
      filetypes[ft] = server.name
    end
  end

  return filetypes
end

-- --------------------------------------------------------------------------}}}
-- {{{ Return LSP server names to install

M.lsp_server_names = function()
  local names = {}

  for _, server in pairs(M.filetype_to_server) do
    if server.mason ~= false then
      table.insert(names, server.name)
    end
  end

  return names
end

-- --------------------------------------------------------------------------}}}
-- {{{ Return LSP server options

M.lsp_server_opts = function(server_name)
  for _, server in pairs(M.filetype_to_server) do
    if server.name == server_name then
      if type(server.opts) == 'function' then
        return server.opts()
      end

      return server.opts or {}
    end
  end

  return {}
end

-- --------------------------------------------------------------------------}}}
-- {{{ Return whether Mason should manage an LSP server

M.is_mason_managed_lsp_server = function(server_name)
  for _, server in pairs(M.filetype_to_server) do
    if server.name == server_name then
      return server.mason ~= false
    end
  end

  return true
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Return linter names to install via mason-nvim-lint

M.linters_for_mason = function()
  return {
    "shellcheck",
    "clangtidy",
    "hadolint",
    "golangci-lint",
    "tidy",
    "eslint_d",
    "jsonlint",
    "luacheck",
    "markdownlint",
    "flake8",
    "rubocop",
    "sqlfluff",
    "taplo",
    "vint",
    "xmllint",
    "yamllint",
  }
end

-- ------------------------------------------------------------------------- }}}
return M
