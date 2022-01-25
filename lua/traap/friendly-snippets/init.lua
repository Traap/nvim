--  {{{ Use protected call so we don't error on first use.

local  luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- ------------------------------------------------------------------------- }}}}
--  {{{ Enable snippets for languages I use.

require('luasnip.loaders.from_vscode').load{}

luasnip.filetype_extend("ruby", {"rails"})



-- ------------------------------------------------------------------------- }}}}
