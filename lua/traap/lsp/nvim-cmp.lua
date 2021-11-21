-- {{{ Credits

-- https://github.com/hrsh7th/nvim-cmp

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis.

local vim =vim
local api = vim.api
local fn = vim.fn
local function keymap(...) vim.api.nvim_set_keymap(...) end

-- ------------------------------------------------------------------------- }}}
-- {{{ Source mappings.  Found reading ThePrimeagen nvim config.

local source_mapping = {
  buffer   = " ﬘  (Buffer)",
  calc     = "   (Calc)",
  nvim_lsp = "   (LSP)",
  path     = "   (Path)",
  spell    = "   (Spell)",
  vsnip    = "   (Snippet)",
}

local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Cmp plugin setup.

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      require("luasnip").lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
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

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },

  sources = {
    { name = "cmp_tabnine" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
--    { name = "vsnip" },
    { name = "buffer" },
  },
})


-- ------------------------------------------------------------------------- }}}
-- {{{ Buffer setup.
--
--     Use buffer source for `/` (if you enabled `native_menu`, this won't work
--     hanymore).


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
-- {{{ config lsp


local function config(_config)
  return vim.tbl_deep_extend(
    "force", {
      capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
      ),
    },
    _config or {}
  )
end

-- require("lspconfig").ruby.setup(config())

-- ------------------------------------------------------------------------- }}}
