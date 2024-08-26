-- {{{ Global definitions

require("traap.core.globals")

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable LazyVim keybindsings

-- Delete the current line.
Keymap("n", "<A-j>", "")
Keymap("i", "<A-j>", "")
Keymap("v", "<A-j>", "")

Keymap("n", "<A-k>", "")
Keymap("i", "<A-k>", "")
Keymap("v", "<A-k>", "")

-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings.

-- Delete the current line.
Keymap("n", "-", "dd", {desc = "Delete line"})

-- Select (charwise) the contents of the current line, excluding indentation.
Keymap("n", "vv", "^vg_", {desc = "Charwise line select" })

-- Select entire buffer
Keymap("n", "vaa", "ggvGg_", {desc = "Select buffer char mode"})
Keymap("n", "Vaa", "ggVG", {desc = "Select buffer line mode "})


-- Save all files.
Keymap("n", "<F2>", "<cmd>wall<cr>", {desc="Save all files"})

-- Toggle [in]visible characters.
Keymap("n", "<leader>i", "<cmd>set list!<cr>", {desc="Toggle invisible chars"})

-- Stay in indent mode.
Keymap("v", "<", "<gv", {desc="Visual Outdent"})
Keymap("v", ">", ">gv", {desc="Visual Indent"})

-- Obfuscate
Keymap("n", "<f3>", "mmggg?G`m", {desc="Obfuscate toogle"})

-- <leader>x conflicts with LazyVim
Keymap("n", "<leader>X", "<Plug>(bullets-toggle-checkbox)", {desc="Checkbox toggle"})

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
Keymap("n", "<localleader>E", [[0mMvg_"ky :exec "r!" getreg("k")<cr>]], {desc="Execute current line"})
Keymap("v", "<localleader>E", [["ky :exec "r!" getreg("k")<cr>]], {desc="Execute current selection"})

-- ------------------------------------------------------------------------- }}}
-- {{{ Q/q - Quit

-- Quit all and Save All
Keymap("n", "<leader>qq", "<cmd>qall!<cr>")
Keymap("n", "<c-s>", "<cmd>wall!<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

Keymap("n", "<localleader><space>", "<cmd>nohlsearch<cr>")

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
Keymap("n", "<leader>bx", [[<cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Yank buffer

Keymap("n", "<leader>yb", 'ggVGg_"+y', {desc="Select buffer char mode"})

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV commands

vim.api.nvim_set_keymap('x', 'gk',
  [[:lua require("traap.core.functions.KJV").insert_verse_from_visual_selection()<cr>]],
  { noremap = true, silent = true, desc = "Insert verse from visual selection" }
)

vim.api.nvim_set_keymap('n', 'gk',
  [[:lua require("traap.core.functions.KJV").insert_verse_from_line()<cr>]],
  { noremap = true, silent = true, desc = "Insert verse from line" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

Keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", {desc="Checkhealth"})
Keymap("n", "<leader>oo", "<cmd>only<cr>", {desc="Only current buffer"})

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

Keymap("n", "<leader>sj", "<cmd>split<cr>", {desc="Split horizontal"})
Keymap("n", "<leader>sl", "<cmd>vsplit<cr>", {desc="Split vertical"})
Keymap("n", "<leader>ss", "0v)k$:sort<cr>", {desc="Sort acronym list"})

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Whitespace

Keymap("n", "<leader>wr", [[mz<cmd>%s/\r//g<cr><cmd>let @/=''<cr>`z]],
  {desc="Remove Windoz line ending"})

Keymap("n", "<leader>wt", [[mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z]],
  {desc="Convert tab to 2 spaces"})

Keymap("n", "<leader>ww", [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]],
  {desc="Remove line end and trailing white spaces"})


vim.api.nvim_set_keymap(
  "n", "<leader>wl", "<cmd>g/^\\s*$/d<CR>",
  { desc="Delete empty lines"}
)

-- ------------------------------------------------------------------------- }}}
