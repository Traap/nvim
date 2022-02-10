--  {{{ Use protected call so we don't error on first use.

local  luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- ------------------------------------------------------------------------- }}}}
--  {{{ Enable snippets for languages I use.

require('luasnip.loaders.from_vscode').load{}

luasnip.filetype_extend("ruby", {"rails"})

local date = function() return {os.date('%Y-%m-%d')} end

luasnip.snippets = {
  all = {
    luasnip.snippet({
      trig = 'date',
      namr = 'Date',
      dscr = 'Date in the form of YYYY-MM-DD'
    },{
      luasnip.function_node(date, {}),
    }),
  }
}

-- ------------------------------------------------------------------------- }}}}
