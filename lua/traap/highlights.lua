-- {{{ Alias to vim APis.

local cmd = vim.cmd

-- ------------------------------------------------------------------------- }}}
-- {{{ Colors

local base16 = require 'base16'
base16(base16.themes['onedark'],true)

-- ------------------------------------------------------------------------- }}}
-- {{{ Color contrasts pleasing to my eyes.

-- Clear items I want full control over.
cmd 'highlight clear ColorColumn'
cmd 'highlight clear Concel'
cmd 'highlight clear CursorLine'
cmd 'highlight clear Folded'
cmd 'highlight clear SpellBad'

-- I use color 18 and 19, which will change when I switch base16 colorscemes.
cmd 'highlight ColorColumn ctermbg=18 guifg=#2a2e36 gui=none'
cmd 'highlight Comment       guifg=#80a0ff gui=none'
cmd 'highlight Cursorlinenrr guifg=#61afef gui=none'
cmd 'highlight DiffAdd    cterm=bold ctermfg=10  ctermbg=19 gui=none guifg=bg guibg=fg'
cmd 'highlight DiffChange cterm=bold ctermfg=5   ctermbg=19 gui=none guifg=bg guibg=fg'
cmd 'highlight DiffDelete cterm=bold ctermfg=9   ctermbg=19 gui=none guifg=bg guibg=fg'
cmd 'highlight DiffText   cterm=bold ctermfg=155 ctermbg=19 gui=none guifg=bg guibg=fg'
cmd 'highlight Folded        guifg=#80a0ff gui=bold'
cmd 'highlight SignColumn  ctermbg=19'
cmd 'highlight SpellBad   cterm=underline ctermfg=3   ctermbg=19 gui=undercurl'
cmd 'highlight search     cterm=bold      ctermfg=16  ctermbg=19 gui=none guifg=bg guibg=fg'

-- ------------------------------------------------------------------------- }}}
