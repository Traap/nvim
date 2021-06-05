local cmd = vim.cmd

cmd 'highlight clear ColorColumn'
cmd 'highlight clear CursorLine'
cmd 'highlight clear Folded'

cmd 'highlight ColorColumn   guifg=#2a2e36 gui=none'
cmd 'highlight Comment       guifg=#80a0ff gui=none'
cmd 'highlight Cursorlinenrr guifg=#61afef gui=none'
cmd 'highlight Folded        guifg=#80a0ff gui=bold'
