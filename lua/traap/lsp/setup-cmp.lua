-- {{{ Credits


-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/ThePrimeagen/.dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch
--
-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis and other required packages.

local vim = vim
local api = vim.api

local  cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end

local  lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then return end

local  luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: check_backspace function

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: icons
--
--  https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisationsv

local kind_icons = require('traap/config').lsp_kind_icons

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
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
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

local formatting = {
  format = function(entry, vim_item)
    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
    vim_item.menu = (source_mapping)[entry.source.name]
    return vim_item
  end
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: lspkind

lspkind.init({
  with_text = true,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: cmp

cmp.setup({
  formatting = formatting,
  mapping = mapping,
  snippet = snippet,
  sources = sources,
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
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
