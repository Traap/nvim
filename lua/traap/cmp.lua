-- {{{ Credits

-- https://github.com/LunarVim/Neovim-from-scratch
-- https://github.com/LunarVim/nvim-basic-ide
-- https://github.com/Rafamadriz/NeoCode
-- https://github.com/ThePrimeagen/.dotfiles
-- https://github.com/hrsh7th/nvim-cmp

-- ------------------------------------------------------------------------- }}}
-- {{{ Alias to vim APis and other required packages.

local  cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end

local  luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: check_backspace function

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: completion

local completion = {
  keyword_length = 3,
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
-- {{{ Define: icons
--
--  https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisationsv

local kind_icons = require('traap.constants').lsp_kind_icons

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: keystroke mappings

local mapping = {
  -- ["<C-j>"] = cmp.mapping.select_next_item(),
  -- ["<C-k>"] = cmp.mapping.select_prev_item(),

  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),

  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

  ['<C-y>'] = cmp.config.disable,

  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),

  -- Do not explicitly select 'first' item when nothing is selected.
  ['<CR>'] = cmp.mapping.confirm({ select = false }),

  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, { "i", "s", }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s", }),
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: source mappings

local source_mapping = {
  spell         = "[Spell]",
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
  { name = "luasnip",       keyword_length = 1 },
  { name = "spell",         keyword_length = 2 },
  { name = "buffer",        keyword_length = 2 },
  { name = "nvim_lsp",      keyword_length = 2 },
  { name = "calc",          keyword_length = 2 },
  { name = "latex_symbols", keyword_length = 1 },
  { name = "nvim_lua",      keyword_length = 1 },
  { name = "path",          keyword_length = 3 },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Define: spelling languages

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }

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
-- {{{ Define: window

local window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup: cmp

cmp.setup({
  completion = completion,
  confirm_opts = confirm_opts,
  experimental = experimental,
  formatting = formatting,
  mapping = mapping,
  snippet = snippet,
  sources = sources,
  window = window,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion: command line and path.

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  },{
    { name = 'cmdline', keyword_length = 4, max_item_count = 50}
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer', max_item_count = 50}
  }
})

-- ------------------------------------------------------------------------- }}}
