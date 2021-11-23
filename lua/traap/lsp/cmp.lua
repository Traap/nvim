-- {{{ Credits

-- https://github.com/hrsh7th/nvim-cmp

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis.

local vim =vim
local api = vim.api
local fn = vim.fn
local function keymap(...) vim.api.nvim_set_keymap(...) end


-- ------------------------------------------------------------------------- }}}

vim.opt.completeopt = "menuone,noselect"

-- {{{ Source mappings.  Found reading ThePrimeagen nvim config.

local source_mapping = {
  buffer   = " ﬘  (Buffer)",
  calc     = "   (Calc)",
  nvim_lsp = "   (LSP)",
  path     = "   (Path)",
  spell    = "   (Spell)",
  vsnip    = "   (Snippet)",
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define has words before function.

local has_words_before = function()
  local line, col = unpack(api.nvim_win_get_cursor(0))
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define feedkey function

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define icons
--
--  https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisationsv

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup nvim-cmp

local cmp = require'cmp'
vim.opt.completeopt = "menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif vim.fn["vsnip#available"]() == 1 then
      feedkey("<Plug>(vsnip-expand-or-jump)", "")
    elseif has_words_before() then
      cmp.complete()
    else
      fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "cmp_tabnine" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },

  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
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

-- local function config(_config)
--   return vim.tbl_deep_extend(
--     "force", {
--       capabilities = require("cmp_nvim_lsp").update_capabilities(
--       vim.lsp.protocol.make_client_capabilities()
--       ),
--     },
--     _config or {}
--   )
-- end
-- require("lspconfig").ruby.setup(config())

-- ------------------------------------------------------------------------- }}}
