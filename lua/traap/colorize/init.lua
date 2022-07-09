-- {{{ Setup colorizer.

local  colorizer_ok, colorizer = pcall(require, 'colorizer')
if not colorizer_ok then return end

colorizer.setup(
  {"*"},
  {
    RGB      = true,         -- #RGB hex codes
    RRGGBB   = true,         -- #RRGGBB hex codes
    RRGGBBAA = true,         -- #RRGGBBAA hex codes
    css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
    hsl_fn   = true,         -- CSS hsl() and hsla() functions
    names    = false,        -- "Name" codes like Blue oe blue
    rgb_fn   = true,         -- CSS rgb() and rgba() functions
    mode     = "background", -- Modes: foreground, background, virtualtext
  }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ base16 colors

local  base16_ok, b16 = pcall(require, 'base16')
if not base16_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Base16 support variables.

local M  = {
  position = 42,
  theme = 'chalk',
  names = require('base16').theme_names(),
  changedTheme = false,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Transparent background.  TODO:  Make a toggle function.

vim.g.transparent_enabled = false

-- ------------------------------------------------------------------------- }}}
-- {{{ Sort Themes

function M.base16SortThemeNames()
  table.sort(M.names)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Clear items I want full control over.

function M.clearColors()
  vim.cmd 'highlight clear Concel'
  vim.cmd 'highlight clear CursorLine'
  vim.cmd 'highlight clear Folded'
  vim.cmd 'highlight clear LinjNr'
  vim.cmd 'highlight clear SpellBad'
  vim.cmd 'highlight clear SignColumn'
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Regardless of theme, I can see the colors.

function M.setColors()
  vim.cmd 'highlight CursorlineNr  guifg=#e06c74 gui=none'
  vim.cmd 'highlight DiffAdd       guifg=#7eca9c gui=none'
  vim.cmd 'highlight DiffChange    guifg=#519ABA gui=none'
  vim.cmd 'highlight DiffDelete    guifg=#ff75a0 gui=none'
  vim.cmd 'highlight DiffText      guifg=#EBCB8B gui=none'
  vim.cmd 'highlight Folded        guifg=#80a0ff gui=none'
  vim.cmd 'highlight LineNr        guifg=#2a2e36 gui=none'
  vim.cmd 'highlight SpellBad      guibg=#DE6874 gui=undercurl'
  vim.cmd 'highlight search        guibg=#BD77DC gui=none'
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Clear and set colors.

function M.base16AdjustColors()
  M.clearColors()
  M.setColors()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Activeate requested theme.

function M.base16ActivateTheme()
  M.theme = M.names[M.position]
  b16(b16.themes[M.theme], true)
  M.base16AdjustColors()
  if (M.changedTheme) then
    -- vim.api.nvim_echo({{M.theme, 'Normal'}}, false, {})
    vim.api.nvim_notify(M.theme, 1, {})
  end
  M.changedTheme = true
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Next theme.

function M.base16NextTheme()
  M.position = (M.position % #M.names) + 1
  if M.position >= #M.names then
    M.position = 0
  end
  M.base16ActivateTheme()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Previous theme.

function M.base16PrevTheme()
  M.position = (M.position % #M.names) - 1
  if M.position < 0 then
    M.position = #M.names
  end
  M.base16ActivateTheme()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define commands and activeate theme.

vim.api.nvim_create_user_command("Base16NextTheme", M.base16NextTheme, {})
vim.api.nvim_create_user_command("Base16PrevTheme", M.base16PrevTheme, {})

M.base16SortThemeNames()
M.base16ActivateTheme()

return M

-- ------------------------------------------------------------------------- }}}
