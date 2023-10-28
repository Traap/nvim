-- {{{ Global definitions

require("config.traap.globals")

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable LazyVim keybindsings

-- Delete the current line.
Keymap("n", "<A-j", "")
Keymap("n", "<A-k", "")
Keymap("i", "<A-j", "")
Keymap("i", "<A-k", "")
Keymap("v", "<A-j", "")
Keymap("v", "<A-k", "")

-- Keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
-- Keymap("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
-- Keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
-- Keymap("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings.

-- Delete the current line.
Keymap("n", "-", "dd")

-- Select (charwise) the contents of the current line, excluding indentation.
Keymap("n", "vv", "^vg_")

-- Select entire buffer
Keymap("n", "vaa", "ggvGg_")
Keymap("n", "Vaa", "ggVG")
Keymap("n", "<leader>V", "V`]")

-- Save all files.
Keymap("n", "<F2>", "<cmd>wall<cr>")

-- Toggle [in]visible characters.
Keymap("n", "<leader>i", "<cmd>set list!<cr>")

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Visual yank
Keymap("v", "<leader>cc", '"+y')

-- Obfuscate
Keymap("n", "<f3>", "mmggg?G`m")

-- <leader>x conflicts with LazyVim
Keymap("n", "<leader>X", "<Plug>(bullets-toggle-checkbox)")

-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
Keymap("n", "zv", "zMzvzz")

-- Close current fold when open. Always open next fold.
Keymap("n", "zj", "zcjzOzz")

-- Close current fold when open. Always open previous fold.
Keymap("n", "zk", "zckzOzz")

-- ------------------------------------------------------------------------- }}}
-- {{{ Keep the cursor in place while joining lines.

Keymap("n", "J", "mzJ`z")
Keymap("n", "<leader>J", "myvipJ`ygq<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of text as a shell command.
Keymap("n", "<localleader>E", [[0mMvg_"ky :exec "r!" getreg("k")<cr>]])
Keymap("v", "<localleader>E", [["ky :exec "r!" getreg("k")<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ Q/q - Quit

-- Quit all
Keymap("n", "<c-q>", "<cmd>qall!<cr>")

-- TODO: Experiment without <leader>qq and start using <c-q>.  Use rightside
-- keyboard <ctrl> key.
-- Keymap("n", "<leader>qq", "<cmd>qall!<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

Keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

Keymap("n", "<leader>HH", "<cmd>silent vert bo help<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ V - Linewise reselection of what you just pasted.

Keymap("n", "<leader>VV", "V`]")

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

Keymap("n", "<leader>bh", "<cmd>vertical resize -1<cr>")
Keymap("n", "<leader>bj", "<cmd>resize +1<cr>")
Keymap("n", "<leader>bk", "<cmd>resize -1<cr>")
Keymap("n", "<leader>bl", "<cmd>vertical resize +1<cr>")
Keymap(
  "n",
  "<leader>bx",
  [[<cmd>w<cr><cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]]
)

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Copy & Paste

Keymap("n", "<leader>cc", 'ggVGg_"+y')

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV commands

Keymap("n", "gk", [[^mmvg_"ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>'mddi- v}gq]])
Keymap("v", "gk", [["ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
Keymap("n", "gK", [[^vg_"ky<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>")
Keymap("n", "<leader>oo", "<cmd>only<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ p - Package manager

Keymap("n", "<leader>ph", "<cmd>Lazy home<cr>")
Keymap("n", "<leader>pl", "<cmd>Lazy log<cr>")
Keymap("n", "<leader>pp", "<cmd>Lazy profile<cr>")
Keymap("n", "<leader>ps", "<cmd>Lazy sync<cr>")
Keymap("n", "<leader>pu", "<cmd>Lazy update<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

Keymap("n", "<leader>sh", "<cmd>split<cr>")
Keymap("n", "<leader>sv", "<cmd>vsplit<cr>")
Keymap("n", "<leader>ss", "0v)k$:sort<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Whitespace

Keymap("n", "<leader>wr", "<cmd>%s/\r//g<cr>")
Keymap("n", "<leader>wt", "mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z")
Keymap("n", "<leader>ww", [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]])
Keymap("n", "<leader>wx", "<cmd>g/^\\s*$/d<cr>")

-- ------------------------------------------------------------------------- }}}
