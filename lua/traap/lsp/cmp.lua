-- {{{ Credits


-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/ThePrimeagen/.dotfiles

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis and other required packages.

local vim =vim
local api = vim.api
local cmp = require'cmp'
local lspkind = require("lspkind")

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: has words before function.

local has_words_before = function()
  local line, col = unpack(api.nvim_win_get_cursor(0))
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


-- ------------------------------------------------------------------------- }}}
-- {{{ Define: feedkey function

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: icons
--
--  https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisationsv

local kind_icons = {
  Class         = "ﴯ",
  Color         = "",
  Constant      = "",
  Constructor   = "",
  Enum          = "",
  EnumMember    = "",
  Event         = "",
  Field         = "",
  File          = "",
  Folder        = "",
  Function      = "",
  Interface     = "",
  Keyword       = "",
  Method        = "",
  Module        = "",
  Operator      = "",
  Property      = "ﰠ",
  Reference     = "",
  Snippet       = "",
  Struct        = "",
  Text          = "",
  TypeParameter = "",
  Unit          = "",
  Value         = "",
  Variable      = "",
  buffer        = "﬘ ",
  calc          = " ",
  nvim_lsp      = " ",
  path          = " ",
  spell         = " ",
  vsnip         = " ",
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: mappings

local mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable,
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: source mappings.

local source_mapping = {
  buffer        = "[Buffer]",
  latex_symbols = "[LaTeX]",
  luasnip       = "[LuaSnip]",
  nvim_lsp      = "[LSP]",
  nvim_lua      = "[Lua]",
  path          = "[Path]",
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: sources

local sources = {
  { name = "buffer" },
  { name = "calc" },
  { name = "latex_symbols" },
  { name = "luasnip" },
  { name = "nvim_lsp" },
  { name = "nvim_lua" },
  { name = "path" },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: snippet

local snippet = {
  expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: formatting

-- local formatting = {
--   format = function(entry, vim_item)
--     vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
--     vim_item.menu = ({
--       buffer = "[Buffer]",
--       nvim_lsp = "[LSP]",
--       luasnip = "[LuaSnip]",
--       nvim_lua = "[Lua]",
--       latex_symbols = "[LaTeX]",
--     })[entry.source.name]
--     return vim_item
--   end
-- }

local formatting = {
  format = function(entry, vim_item)
    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
    vim_item.menu = (source_mapping)[entry.source.name]
    return vim_item
  end
}


-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: lspkind

require('lspkind').init({
  with_text = true,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: cmp

-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup({
  snippet = snippet,
  mapping = mapping,
  sources = sources,
  formatting = formatting,
})


-- ------------------------------------------------------------------------- }}}
-- {{{ Completion: path and command line.

cmp.setup.cmdline('/', {
  sources = {
    {name = 'buffer'},
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources(
    {{name = 'path'}},
    {{name = 'cmdline'}}
  )
})


-- ------------------------------------------------------------------------- }}}
