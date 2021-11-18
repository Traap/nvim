-- {{{ Credits

-- https://github.com/hrsh7th/nvim-cmp

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis.

local vim =vim
local api = vim.api
local fn = vim.fn
local function keymap(...) vim.api.nvim_set_keymap(...) end

-- ------------------------------------------------------------------------- }}}
-- {{{ Cmp plugin setup.

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>`
    -- mapping.
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer setup.
--
--     Use buffer source for `/` (if you enabled `native_menu`, this won't work
--     hanymore).

    -- buffer         = {kind = " ﬘  (Buffer)"},
    -- calc           = {kind = "   (Calc)"},
    -- nvim_lsp       = {kind = "   (LSP)"},
    -- path           = {kind = "   (Path)"},
    -- spell          = {kind = "   (Spell)"},
    -- vsnip          = {kind = "   (Snippet)"},

require'cmp'.setup.cmdline('/',{
  sources = cmp.config.sources({
    {name = 'nvim_lsp_document_symbol'}
  }, {
    {name = 'buffer'}
  })
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Calculator setup.

cmp.setup {
  sources = {
    { name = 'calc' }
  }
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Nvim lsp setup.

cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}


-- ------------------------------------------------------------------------- }}}
-- {{{ Nvim lua setup.

cmp.setup {
  sources = {
    { name = 'nvim_lua' }
  }
}


-- ------------------------------------------------------------------------- }}}
-- {{{ Path setup.
--
--     Use cmdline & path source for ':' (if you enabled `native_menu`, this
--     won't work anymore).

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- ------------------------------------------------------------------------- }}}
-- {{{ Spelling setup.

cmp.setup {
  sources = {
    { name = 'spell' }
  }
}

-- ------------------------------------------------------------------------- }}}
