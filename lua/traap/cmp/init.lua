-- {{{ Credits
--
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/ThePrimeagen/.dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://github.com/Rafamadriz/NeoCode
--
-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis and other required packages.

local vim = vim

local  cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end

local  luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: check_backspace function

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: completion

local completion = {
  keyword_lenght = 3,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: confirm_opts

local confirm_opts = {
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: experimental

local experimental = {
  ghost_text = true,
  native_menu = false,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: has words before function

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s"
    == nil
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: icons
--
--  https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisationsv

local kind_icons = require('traap.config').lsp_kind_icons

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: keystroke mappings

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
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: source mappings

local source_mapping = {
  luasnip       = "[Snippet]",
  nvim_lsp      = "[LSP]",
  buffer        = "[Buffer]",
  latex_symbols = "[LaTeX]",
  nvim_lua      = "[Lua]",
  path          = "[Path]",
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: sources

local sources = {
  { name = "luasnip",       keyword_length = 1, max_item_count = 10 },
  { name = "nvim_lsp",      keyword_length = 2, max_item_count = 10 },
  { name = "buffer",        keyword_length = 4, max_item_count = 10 },
  { name = "calc",          keyword_length = 4, max_item_count = 10 },
  { name = "latex_symbols", keyword_length = 1, max_item_count = 10 },
  { name = "nvim_lua",      keyword_length = 2, max_item_count = 10 },
  { name = "path",          keyword_length = 5, max_item_count = 10 },
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

local formatting = {
  fields = {'kind', 'abbr', 'menu'},
  format = function(entry, vim_item)
    vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
    vim_item.menu = (source_mapping)[entry.source.name]
    return vim_item
  end
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: documentation borders.

-- local documentation = require('traap.config').display_boarder

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: cmp

cmp.setup({
  completion = completion,
  confirm_opts = confirm_opts,
  documentation = {border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}},
  experimental = experimental,
  formatting = formatting,
  mapping = mapping,
  snippet = snippet,
  sources = sources,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion: command line and path.

cmp.setup.cmdline(':', {
  sources = {
    {name = 'cmdline', keyword_length = 4, max_item_count = 10}
  }
})

cmp.setup.cmdline('/', {
  sources = {
    {name = 'buffer', max_item_count = 10}
  }
})

-- ------------------------------------------------------------------------- }}}
