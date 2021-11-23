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

-- ------------------------------------------------------------------------- }}}
-- {{{ Define has words before function.

local has_words_before = function()
  local line, col = unpack(api.nvim_win_get_cursor(0))
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define feedkey funcction

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup nvim-cmp

local cmp = require'cmp'
local lspkind = require('lspkind')

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
--    { name = "vsnip" },
    { name = "buffer" },
  },

  formatting = {
    -- format = function(entry, vim_item)
    --   vim_item.kind = lspkind.presets.default[vim_item.kind]
    --   local menu = source_mapping[entry.source.name]
    --   if entry.source.name == 'cmp_tabnine' then
    --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
    --       menu = entry.completion_item.data.detail .. ' ' .. menu
    --     end
    --     vim_item.kind = ''
    --   end
    --   vim_item.menu = menu
    --   return vim_item
    -- end
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
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

-- cmp.setup {
--   sources = {
--     { name = 'nvim_lsp' }
--   }
-- }


-- ------------------------------------------------------------------------- }}}
-- {{{ Nvim lua setup.

-- cmp.setup {
--   sources = {
--     { name = 'nvim_lua' }
--   }
-- }


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
