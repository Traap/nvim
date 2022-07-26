-- {{{ base16 colors

local  base16_ok, b16 = pcall(require, 'base16')
if not base16_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Base16 support variables.

local M  = {
  position = 42,
  theme = 'dracula',
  names = require('base16').theme_names(),
  themesAreNotSorted = true,
  transparent = false,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Sort Themes

function M.base16SortThemeNames()
  if (M.themesAreNotSorted) then
    table.sort(M.names)
    M.themesAreNotSorted = false
  end
  return M.names
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Record theme change and position.

function M.base16SavePositionAndTheme(position)
  M.position = position
  M.theme = M.names[M.position]
  vim.api.nvim_notify(M.theme, 1, {})
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Find Theme

function M.base16SetAndActivateTheme(theme)
  if (M.theme ~= theme) then
    for position, name in pairs(M.names) do
      if (name == theme) then
        M.base16SavePositionAndTheme(position)
      end
    end
    M.base16ActivateTheme()
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Clear items I want full control over.

function M.clearColors()
  vim.cmd 'highlight clear Concel'
  vim.cmd 'highlight clear CursorLine'
  vim.cmd 'highlight clear Folded'
  -- vim.cmd 'highlight clear LinNr'
  vim.cmd 'highlight clear SpellBad'
  vim.cmd 'highlight clear SignColumn'
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Regardless of theme, I can see these colors.

function M.setColors()
  vim.cmd 'highlight CursorlineNr  guifg=#e06c74 gui=none'
  vim.cmd 'highlight DiffAdd       guifg=#7eca9c gui=none'
  vim.cmd 'highlight DiffChange    guifg=#519ABA gui=none'
  vim.cmd 'highlight DiffDelete    guifg=#ff75a0 gui=none'
  vim.cmd 'highlight DiffText      guifg=#EBCB8B gui=none'
  vim.cmd 'highlight Folded        guifg=#80a0ff gui=none'
  -- vim.cmd 'highlight LineNr        guifg=#2a2e36 gui=none'
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
  M.base16Transparancy()
  b16(b16.themes[M.theme], true)
  M.base16AdjustColors()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Toggle transparency

function M.base16ToggleTransparancy()
  if M.transparent then
    M.transparent = false
  else
    M.transparent = true
  end
  M.base16Transparancy()
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Transparent background.

function M.base16Transparancy()
  vim.g.transparent_enabled = M.transparent
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Next theme.

function M.base16NextTheme()
  local position = (M.position % #M.names) + 1
  if position >= #M.names then
    position = 0
  end
  M.base16SetAndActiveTheme(M.names[position])
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Previous theme.

function M.base16PrevTheme()
  local position = (M.position % #M.names) - 1
  if position < 0 then
    position = #M.names
  end
  M.base16SetAndActiveTheme(M.names[position])
end

-- ------------------------------------------------------------------------- }}}
-- {{{ List Themes using Telescope

function M.base16ListThemes(opts)
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  opts = opts or {}

  pickers.new(opts, {

    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        M.base16SetAndActivateTheme(selection[1])
      end)
      return true
    end,

    finder = finders.new_table {
      results = M.base16SortThemeNames()
    },

    prompt_title = "Themes",

    sorter = conf.generic_sorter(opts),

  }):find()

end

-- ------------------------------------------------------------------------- }}}
-- {{{ Pick a color Theme.
function M.base16PickTheme()
  M.base16ListThemes(require("telescope.themes").get_dropdown{})
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Define commands and activeate theme.

local cud = vim.api.nvim_create_user_command

cud("NextTheme", M.base16NextTheme, {})
cud("PrevTheme", M.base16PrevTheme, {})
cud("PickTheme", M.base16PickTheme, {})
cud("ToggleTransparancy", M.base16ToggleTransparancy, {})

-- M.base16SortThemeNames()
M.base16ActivateTheme()

return M

-- ------------------------------------------------------------------------- }}}
