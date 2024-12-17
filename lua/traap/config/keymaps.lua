-- {{{ local keymap function

-- keymaps are silent and noremap by default
local function keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  opts.noremap = opts.noremap ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable LazyVim keybindsings

-- Delete the current line.
keymap("n", "<A-j>", "")
keymap("i", "<A-j>", "")
keymap("v", "<A-j>", "")

keymap("n", "<A-k>", "")
keymap("i", "<A-k>", "")
keymap("v", "<A-k>", "")

-- ------------------------------------------------------------------------- }}}
-- {{{ General mappings.

-- Delete the current line.
keymap("n", "-", "dd", {desc = "Delete line"})

-- Select (charwise) the contents of the current line, excluding indentation.
keymap("n", "vv", "^vg_", {desc = "Charwise line select" })

-- Select entire buffer
keymap("n", "vaa", "ggvGg_", {desc = "Select buffer char mode"})
keymap("n", "Vaa", "ggVG", {desc = "Select buffer line mode "})


-- Save all files.
keymap("n", "<F2>", "<cmd>wall<cr>", {desc="Save all files"})

-- Toggle [in]visible characters.
keymap("n", "<leader>i", "<cmd>set list!<cr>", {desc="Toggle invisible chars"})

-- Stay in indent mode.
keymap("v", "<", "<gv", {desc="Visual Outdent"})
keymap("v", ">", ">gv", {desc="Visual Indent"})

-- Obfuscate
keymap("n", "<f3>", "mmggg?G`m", {desc="Obfuscate toogle"})

-- <leader>x conflicts with LazyVim
keymap("n", "<leader>X", "<Plug>(bullets-toggle-checkbox)", {desc="Checkbox toggle"})

-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap("n", "zv", "zMzvzz", {desc='Close all folds except current'})

-- Close current fold when open. Always open next fold.
keymap("n", "zj", "zcjzOzz", {desc='Close fold & open next one'})

-- Close current fold when open. Always open previous fold.
keymap("n", "zk", "zckzOzz", {desc='Close fold & open previous one'})

-- ------------------------------------------------------------------------- }}}
-- {{{ Keep the cursor in place while joining lines.

keymap("n", "J", "mzJ`z", {desc="Join lines"})
keymap("n", "<leader>J", "myvipJ`ygq<cr>", {desc="Join Paragraph"})

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of text as a shell command.
keymap("n", "<localleader>E",
  [[0mMvg_"ky :exec "r!" getreg("k")<cr>]], {desc="Execute current line"}
)

keymap("v", "<localleader>E",
  [["ky :exec "r!" getreg("k")<cr>]], {desc="Execute current selection"}
)

-- ------------------------------------------------------------------------- }}}
-- {{{ Q/q - Quit

-- Quit all and Save All
keymap("n", "<leader>q", "<cmd>qall!<cr>", {desc="Quit all!"})
keymap("n", "<leader>wq", "<cmd>wall!<cr>", {desc="Write quit all!" })

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>", {desc="Clear highghted"})

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

keymap("n", "<leader>HH", "<cmd>silent vert bo help<cr>", {desc="Vertical help"})

-- ------------------------------------------------------------------------- }}}
-- {{{ V - Linewise reselection of what you just pasted.

keymap("n", "<leader>VV", "V`]", {desc="Linewise reslection of last paste"})

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

keymap("n", "<leader>bh",
  "<cmd>vertical resize -1<cr>",
  {desc='Vertical resize -1'}
)

keymap("n", "<leader>bj",
  "<cmd>resize +1<cr>",
  {desc='Horizontal resize +1'}
)

keymap("n", "<leader>bk",
  "<cmd>resize -1<cr>",
  {desc='Horizontal resize -1'}
)

keymap("n", "<leader>bl",
  "<cmd>vertical resize +1<cr>",
  {desc='Vertical resize +1'}
)

keymap("n", "<leader>bx",
  [[<cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]],
  {desc="Source current file."}
)

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Yank buffer

keymap("n", "<leader>yb", 'ggVGg_"+y', {desc="Select buffer char mode"})

keymap('x', 'cb',
  [[:lua require("traap.core.comment_block").surround()<cr>]],
  { desc = 'Surround selction with comment block.'}
)

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV commands

keymap('x', 'gk',
  [[:lua require("traap.core.KJV").insert_verse_from_visual_selection()<cr>]],
  { desc = "Insert verse from visual selection" }
)

keymap('n', 'gk',
  [[:lua require("traap.core.KJV").insert_verse_from_line()<cr>]],
  { desc = "Insert verse from line" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", {desc="Checkhealth"})
keymap("n", "<leader>oo", "<cmd>only<cr>", {desc="Only current buffer"})

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

keymap("n", "<leader>sj", "<cmd>split<cr>", {desc="Split horizontal"})
keymap("n", "<leader>sl", "<cmd>vsplit<cr>", {desc="Split vertical"})
keymap("n", "<leader>ss", "0v)k$:sort<cr>", {desc="Sort acronym list"})
keymap("n", "<leader>sr", "<cmd>GrugFar<cr>", {desc="Scan and Replace"})


-- ------------------------------------------------------------------------- }}}
-- {{{ w - Whitespace

keymap("n", "<leader>wr", [[mz<cmd>%s/\r//g<cr><cmd>let @/=''<cr>`z]],
  {desc="Remove Windoz line ending"})

keymap("n", "<leader>wt", [[mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z]],
  {desc="Convert tab to 2 spaces"})

keymap("n", "<leader>ww", [[mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z]],
  {desc="Remove line end and trailing white spaces"})


vim.api.nvim_set_keymap(
  "n", "<leader>wl", "<cmd>g/^\\s*$/d<CR>",
  { desc="Delete empty lines"}
)

-- ------------------------------------------------------------------------- }}}
