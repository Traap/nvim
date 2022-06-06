-- {{{ Alias to vim APis.

local cmd = vim.cmd

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup colorizer.

local  colorizer_ok, colorizer = pcall(require, 'colorizer')
if not colorizer_ok then return end

colorizer.setup{
  '*',    -- Highlight all files, but customize some others.
  '!vim', -- Exclude vim from highlighting.
}

-- ------------------------------------------------------------------------- }}}
-- {{{ base16 colors

local  base16_ok, base16 = pcall(require, 'base16')
if not base16_ok then return end

base16(base16.themes('chalk'),true)
vim.g.transparent_enabled = true

-- ------------------------------------------------------------------------- }}}
-- {{{ Color contrasts pleasing to my eyes.

-- Clear items I want full control over.
cmd 'highlight clear ColorColumn'
cmd 'highlight clear Concel'
cmd 'highlight clear CursorLine'
cmd 'highlight clear Folded'
cmd 'highlight clear SpellBad'
cmd 'highlight clear SignColumn'

-- I use color 18 and 19, which will change when I switch base16 colorscemes.
cmd 'highlight ColorColumn   guifg=#2a2e36'
cmd 'highlight Comment       guifg=#80a0ff gui=none'
cmd 'highlight CursorlineNr  guifg=#e06c74 gui=none'
cmd 'highlight DiffAdd       guifg=#7eca9c gui=none'
cmd 'highlight DiffChange    guifg=#519ABA gui=none'
cmd 'highlight DiffDelete    guifg=#ff75a0 gui=none'
cmd 'highlight DiffText      guifg=#EBCB8B gui=none'
cmd 'highlight Folded        guifg=#80a0ff gui=none'
cmd 'highlight LineNbr       guifg=#2a2e36 gui=none'
cmd 'highlight SpellBad      guibg=#DE6874 gui=undercurl'
cmd 'highlight search        guibg=#BD77DC gui=none'

-- ------------------------------------------------------------------------- }}}
