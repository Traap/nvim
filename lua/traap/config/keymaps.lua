-- {{{ local keymap function

local platform = require("traap.core.platform")
local keymap = require("traap.core.keymap").keymap
local Snacks = require("snacks")

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
keymap("n", "-", "dd", { desc = "Delete line" })

-- Select (charwise) the contents of the current line, excluding indentation.
keymap("n", "vv", "^vg_", { desc = "Charwise line select" })

-- Select entire buffer
keymap("n", "vaa", "ggvGg_", { desc = "Select buffer char mode" })
keymap("n", "Vaa", "ggVG", { desc = "Select buffer line mode " })

-- Save all files.
keymap("n", ";W", "<cmd>wqall!<cr>", { desc = "Write quit all!" })
keymap("n", ";w", "<cmd>wall<cr>", { desc = "Write all buffers" })
keymap("n", ";q", "<cmd>qall!<cr>", { desc = "Quit all!" })
keymap("n", ";s", "<cmd>write<cr>", { desc = "Write buffer" })

keymap("i", "<C-j>", "<cmd>write<cr>", { desc = "Write buffer" })

-- Toggle [in]visible characters.
keymap("n", "<leader>i", "<cmd>set list!<cr>", { desc = "Toggle invisible chars" })

-- Stay in indent mode.
keymap("v", "<", "<gv", { desc = "Visual Outdent" })
keymap("v", ">", ">gv", { desc = "Visual Indent" })

-- Obfuscate
keymap("n", "<f3>", "mmggg?G`m", { desc = "Obfuscate toogle" })

--  ;x conflicts with LazyVim
keymap("n", ";x", "<Plug>(bullets-toggle-checkbox)", { desc = "Checkbox toggle" })

-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap("n", "zv", "zMzvzz", { desc = 'Close all folds except current' })

-- Close current fold when open. Always open next fold.
keymap("n", "zj", "zcjzOzz", { desc = 'Close fold & open next one' })

-- Close current fold when open. Always open previous fold.
keymap("n", "zk", "zckzOzz", { desc = 'Close fold & open previous one' })

-- ------------------------------------------------------------------------- }}}
-- {{{ Keep the cursor in place while joining lines.

keymap("n", "J", "mzJ`z", { desc = "Join lines" })
keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join Paragraph" })

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of text as a shell command.
keymap("n", "<localleader>E",
  [[0mMvg_"ky :exec "r!" getreg("k")<cr>]], { desc = "Execute current line" }
)

keymap("v", "<localleader>E",
  [["ky :exec "r!" getreg("k")<cr>]], { desc = "Execute current selection" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Clear highghted" })

-- ------------------------------------------------------------------------- }}}
-- {{{ G - Global to buffer.

-- Delete buffer contents.
keymap("n", "<leader>G", "ggdG", { desc = "Delete buffer contents." })

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

keymap("n", "<leader>HH", "<cmd>silent vert bo help<cr>", { desc = "Vertical help" })

-- ------------------------------------------------------------------------- }}}
-- {{{ V - Linewise reselection of what you just pasted.

keymap("n", "<leader>VV", "V`]", { desc = "Linewise reslection of last paste" })

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

keymap("n", "<leader>bh",
  "<cmd>vertical resize -1<cr>",
  { desc = 'Vertical resize -1' }
)

keymap("n", "<leader>bj",
  "<cmd>resize +1<cr>",
  { desc = 'Horizontal resize +1' }
)

keymap("n", "<leader>bk",
  "<cmd>resize -1<cr>",
  { desc = 'Horizontal resize -1' }
)

keymap("n", "<leader>bl",
  "<cmd>vertical resize +1<cr>",
  { desc = 'Vertical resize +1' }
)

keymap("n", "<leader>bx",
  [[<cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]],
  { desc = "Source current file." }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Yank buffer

keymap("n", "<leader>yb", 'ggVGg_"+y', { desc = "Select buffer char mode" })

keymap('x', 'cb',
  [[:lua require("traap.core.comment_block").surround()<cr>]],
  { desc = 'Surround selction with comment block.' }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV and Fugitive commands

keymap('x', 'gk',
  [[:lua require("traap.core.KJV").insert_verse_from_visual_selection()<cr>]],
  { desc = "Insert verse from visual selection" }
)

keymap('n', 'gk',
  [[:lua require("traap.core.KJV").insert_verse_from_line()<cr>]],
  { desc = "Insert verse from line" }
)

keymap("n", "<leader>gP", "<cmd>G pull<cr>", { desc = "Git Pull" })
keymap("n", "<leader>gd", "<cmd>G diff<cr>", { desc = "Git Difference" })
keymap("n", "<leader>gl", "<cmd>G log<cr>", { desc = "Git Log" })
keymap("n", "<leader>gh", "<cmd>vert bo help fugitive<cr>", { desc = "Vertical Help" })
keymap("n", "<leader>gp", "<cmd>G push<cr>", { desc = "Git Push" })
keymap("n", "<leader>gs", "<cmd>G<cr>", { desc = "Git Status" })
keymap("n", "gh", "<cmd>diffget //2<cr>", { desc = "Gitdiff choose left side" })
keymap("n", "gl", "<cmd>diffget //3<cr>", { desc = "Gitdiff choose right size" })

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Checkhealth" })
keymap("n", "<leader>oo", "<cmd>only<cr>", { desc = "Only current buffer" })

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

keymap("n", "<leader>sj", "<cmd>split<cr>", { desc = "Split horizontal" })
keymap("n", "<leader>sl", "<cmd>vsplit<cr>", { desc = "Split vertical" })
keymap("n", "<leader>ss", "0v)k$:sort<cr>", { desc = "Sort acronym list" })
keymap("n", "<leader>sr", "<cmd>GrugFar<cr>", { desc = "Scan and Replace" })


-- ------------------------------------------------------------------------- }}}
-- {{{ w - Whitespace

keymap("n", "<leader>wr", [[mz<cmd>%s/\r//g<cr><cmd>let @/=''<cr>`z]],
  { desc = "Remove Windoz line ending" })

keymap("n", "<leader>wt", [[mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z]],
  { desc = "Convert tab to 2 spaces" })

keymap("n", "<leader>ww", [[mz<cmd>%s/\s\+$//e<cr><cmd>let @/=''<cr>`z]],
  { desc = "Remove line end and trailing white spaces" })

keymap("n", "<leader>]",
  [[:%s/\[\|\]//g<CR>]],
  { noremap = true, silent = true, desc = "Remove [ and ]" }
)

keymap('n', '<leader>r|',
  [[:%s/\\s*|\\s*/|/g<CR>]],
  { noremap = true, silent = true, desc = "Remove whitespace before and after |" })

keymap("n", "<leader>wl", "<cmd>g/^\\s*$/d<CR>", { desc = "Delete empty lines" })
keymap("n", "<leader>|", "<cmd>%s/\t/|/g<CR>", { desc = "Replace \t with |" })

-- ------------------------------------------------------------------------- }}}
-- {{{ x - eXtra quality of life items.

keymap("n", "<leader><leader>xf",
  [[<cmd>source %<cr><cmd>echo 'Sourced ' . @%<cr>]],
  { desc = "Source file" }
)

keymap("n", "<leader><leader>xl",
  [[<cmd>.lua<cr><cmd>echo 'Current line executed.' . <cr>]],
  { desc = "Source current line." }
)

keymap('v', '<leader><leader>xs',
  [[:lua<cr><cmd>echo 'Visual selection executed.'<cr>]],
  { desc = "" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ y - yank

keymap({ "n", "v", "x" }, "<leader>d", '"+d')
keymap({ "n", "v", "x" }, "<leader>y", '"+y')

-- ------------------------------------------------------------------------- }}}
-- {{{ vscode bridge

if platform.is_vscode() then
  -- Navigate VSCode tabs like lazyvim buffers
  keymap("n", "<S-h>", function()
    vscode.call("workbench.action.previousEditor")
  end)

  keymap("n", "<S-l>", function()
    vscode.call("workbench.action.nextEditor")
  end)

  -- Toggle VS Explorer sidebar
  keymap("n", "<S-l>", function()
    vscode.call("workbench.action.toggleSidebarVisibility")
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Snacks

keymap("n", "<leader>fb", Snacks.picker.buffers, { desc = "Buffers" })

keymap("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

keymap("n", "<leader>ff", Snacks.picker.files, { desc = "Find Files" })
keymap("n", "<leader>fg", Snacks.picker.git_files, { desc = "Find Git Files" })
keymap("n", "<leader>fp", Snacks.picker.projects, { desc = "Projects" })
keymap("n", "<leader>fr", Snacks.picker.recent, { desc = "Recent" })

-- Git
keymap("n", "<leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse" })

keymap("n", "<leader>gL", Snacks.picker.git_log_line, { desc = "Git Log Line" })
-- keymap("n", "<leader>gS", Snacks.picker.git_stash, { desc = "Git Stash" })
keymap("n", "<leader>gb", Snacks.picker.git_branches, { desc = "Git Branches" })
keymap("n", "<leader>gd", Snacks.picker.git_diff, { desc = "Git Diff (Hunks)" })
keymap("n", "<leader>gf", Snacks.picker.git_log_file, { desc = "Git Log File" })
keymap("n", "<leader>gl", Snacks.picker.git_log, { desc = "Git Log" })

-- Grep
keymap("n", "<leader>sb", Snacks.picker.lines, { desc = "Buffer Lines" })
keymap("n", "<leader>sB", Snacks.picker.grep_buffers, { desc = "Grep Open Buffers" })
keymap("n", "<leader>sg", Snacks.picker.grep, { desc = "Grep" })
keymap({ "n", "x" }, "<leader>sw", Snacks.picker.grep_word, { desc = "Visual Word or Selection" })

-- Search
keymap("n", "<leader>sC", Snacks.picker.commands, { desc = "Commands" })
keymap("n", "<leader>sD", Snacks.picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
keymap("n", "<leader>sH", Snacks.picker.highlights, { desc = "Highlights" })
keymap("n", "<leader>sM", Snacks.picker.man, { desc = "Man Pages" })
keymap("n", "<leader>sR", Snacks.picker.resume, { desc = "Resume" })
keymap("n", "<leader>sa", Snacks.picker.autocmds, { desc = "Autocmds" })
keymap("n", "<leader>sd", Snacks.picker.diagnostics, { desc = "Diagnostics" })
keymap("n", "<leader>sh", Snacks.picker.help, { desc = "Help Pages" })
keymap("n", "<leader>si", Snacks.picker.icons, { desc = "Icons" })
keymap("n", "<leader>sj", Snacks.picker.jumps, { desc = "Jumps" })
keymap("n", "<leader>sk", Snacks.picker.keymaps, { desc = "Keymaps" })
keymap("n", "<leader>sl", Snacks.picker.loclist, { desc = "Location List" })
keymap("n", "<leader>sm", Snacks.picker.marks, { desc = "Marks" })
keymap("n", "<leader>sp", Snacks.picker.lazy, { desc = "Plugin Specs" })
keymap("n", "<leader>sq", Snacks.picker.qflist, { desc = "Quickfix List" })
keymap("n", "<leader>su", Snacks.picker.undo, { desc = "Undo History" })
keymap("n", "<leader>s/", Snacks.picker.search_history, { desc = "Search History" })
keymap("n", "<leader>sr", Snacks.picker.registers, { desc = "Registers" })
keymap("n", "<leader>uC", Snacks.picker.colorschemes, { desc = "Colorschemes" })

-- Utilities
keymap("n", "<leader>.", Snacks.scratch.open, { desc = "Toggle Scratch Buffer" })
keymap("n", "<leader>S", Snacks.scratch.select, { desc = "Select Scratch Buffer" })
-- keymap("n", "<leader>bd", snacks.bufdelete, { desc = "Delete Buffer" })
keymap("n", "<leader>cR", Snacks.rename.rename_file, { desc = "Rename File" })
keymap("n", "<leader>un", Snacks.notifier.hide, { desc = "Dismiss All Notifications" })
keymap({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
keymap({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
-- ------------------------------------------------------------------------- }}}
