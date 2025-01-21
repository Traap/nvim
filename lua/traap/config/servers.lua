local M = {}
-- {{{ LSP Server names to filetypes

M.filetype_to_server = {
  sh = {
    name = 'bashls',
    filetypes = {
      'sh',
      'bash',
      'zsh',
    }
  },

  cpp = {
    name = 'clangd',
    filetypes = {
      'c',
      'cpp',
      'objc',
      'objcpp',
    }
  },

  css = {
    name = 'cssls',
    filetypes = {
      'css',
      'less',
      'scss',
    }
  },

  emmet = {
    name = 'emmetls',
    filetypes = {
      "astro",
      "css",
      "eruby",
      "html",
      "htmlangular",
      "htmldjango",
      "javascriptreact",
      "less",
      "pug",
      "sass",
      "scss",
      "svelte",
      "typescriptreact",
      "vue",
    }
  },


  python = {
    name = 'pyright',
    filetypes = {
      'python',
    }
  },

  go = {
    name = 'gopls',
    filetypes = {
      'go',
      'gomod'
    }
  },

  json = {
    name = 'jsonls',
    filetypes = {
      'json',
      'jsonc',
    }
  },

  lua = {
    name =
    'lua_ls',
    filetypes = {
      'lua',
    }
  },

  csharp = {
    name = 'omnisharp',
    filetypes = {
      'cs',
      'vb',
    }
  },

  ruby = {
    name = 'solargraph',
    filetypes = {
      'ruby',
    }
  },

  rust = {
    name = 'rust_analyzer',
    filetypes = { 'rust' }
  },

  sql = {
    name = 'sqlls',
    filetypes = {
      'sql',
    }
  },

  tex = {
    name = 'texlab',
    filetypes = {
      'bib',
      'latex',
      'tex',
    }
  },

  typescript = {
    name = 'ts_ls',
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    }
  },

  yaml = {
    name = 'yamlls',
    filetypes = {
      'yaml',
      'yml',
    }
  },
}

-- -------------------------------------------------------------------------- }}}
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
    }
  },

  shellcheck = {
    name = 'shellcheck',
    filetypes = {
      'sh',
    }
  },

  flake8 = {
    name = 'flake8',
    filetypes = {
      'python',
    }
  },
}

-- -------------------------------------------------------------------------- }}}
-- {{{ Formatter names to filetypes

M.formatter = {
  shfmt = {
    name = 'shfmt',
    filetypes = {
      'bash',
      'sh',
    }
  },

  stylua = {
    name = 'stylua',
    filetypes = {
      'lua'
    }
  },
}

-- -------------------------------------------------------------------------- }}}
return M
