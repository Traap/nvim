-- {{{ local keymap function

local platform = require("traap.core.platform")
local keymap = require("traap.core.keymap").keymap

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
keymap(
  "n",
  "<leader>i",
  "<cmd>set list!<cr>",
  { desc = "Toggle invisible chars" }
)

-- Stay in indent mode.
keymap("v", "<", "<gv", { desc = "Visual Outdent" })
keymap("v", ">", ">gv", { desc = "Visual Indent" })

-- Obfuscate
keymap("n", "<f3>", "mmggg?G`m", { desc = "Obfuscate toogle" })

--  ;x conflicts with LazyVim
keymap(
  "n",
  ";x",
  "<Plug>(bullets-toggle-checkbox)",
  { desc = "Checkbox toggle", noremap = false }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ Folding commands.

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap("n", "zv", "zMzvzz", { desc = "Close all folds except current" })

-- Close current fold when open. Always open next fold.
keymap("n", "zj", "zcjzOzz", { desc = "Close fold & open next one" })

-- Close current fold when open. Always open previous fold.
keymap("n", "zk", "zckzOzz", { desc = "Close fold & open previous one" })

-- ------------------------------------------------------------------------- }}}
-- {{{ Keep the cursor in place while joining lines.

keymap("n", "J", "mzJ`z", { desc = "Join lines" })
keymap("n", "<leader>J", "myvipJ`ygq<cr>", { desc = "Join Paragraph" })

-- ------------------------------------------------------------------------- }}}
-- {{{ Shell commands.

-- Execute the current line of text as a shell command.
keymap(
  "n",
  "<localleader>E",
  [[0mMvg_"ky :exec "r!" getreg("k")<cr>]],
  { desc = "Execute current line" }
)

keymap(
  "v",
  "<localleader>E",
  [["ky :exec "r!" getreg("k")<cr>]],
  { desc = "Execute current selection" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

keymap(
  "n",
  "<leader><space>",
  "<cmd>nohlsearch<cr>",
  { desc = "Clear highghted" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ G - Global to buffer.

-- Delete buffer contents.
keymap("n", "<leader>G", "ggdG", { desc = "Delete buffer contents." })

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

keymap(
  "n",
  "<leader>HH",
  "<cmd>silent vert bo help<cr>",
  { desc = "Vertical help" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ V - Linewise reselection of what you just pasted.

keymap("n", "<leader>VV", "V`]", { desc = "Linewise reslection of last paste" })

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffer adjustments.

keymap(
  "n",
  "<leader>bh",
  "<cmd>vertical resize -1<cr>",
  { desc = "Vertical resize -1" }
)

keymap(
  "n",
  "<leader>bj",
  "<cmd>resize +1<cr>",
  { desc = "Horizontal resize +1" }
)

keymap(
  "n",
  "<leader>bk",
  "<cmd>resize -1<cr>",
  { desc = "Horizontal resize -1" }
)

keymap(
  "n",
  "<leader>bl",
  "<cmd>vertical resize +1<cr>",
  { desc = "Vertical resize +1" }
)

keymap(
  "n",
  "<leader>bx",
  [[<cmd>luafile %<cr><cmd>echo "Sourced " . @%<cr>]],
  { desc = "Source current file." }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Yank buffer

keymap("n", "<leader>yb", 'ggVGg_"+y', { desc = "Select buffer char mode" })

keymap(
  "x",
  "cb",
  [[:lua require("traap.core.comment_block").surround()<cr>]],
  { desc = "Surround selction with comment block." }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV and Fugitive commands

keymap(
  "x",
  "gk",
  [[:lua require("traap.core.KJV").insert_verse_from_visual_selection()<cr>]],
  { desc = "Insert verse from visual selection" }
)

keymap(
  "n",
  "gk",
  [[:lua require("traap.core.KJV").insert_verse_from_line()<cr>]],
  { desc = "Insert verse from line" }
)

keymap("n", "<leader>gP", "<cmd>G pull<cr>", { desc = "Git Pull" })
keymap("n", "<leader>gd", "<cmd>G diff<cr>", { desc = "Git Difference" })
keymap("n", "<leader>gl", "<cmd>G log<cr>", { desc = "Git Log" })
keymap(
  "n",
  "<leader>gh",
  "<cmd>vert bo help fugitive<cr>",
  { desc = "Vertical Help" }
)
keymap("n", "<leader>gp", "<cmd>G push<cr>", { desc = "Git Push" })
keymap("n", "<leader>gs", "<cmd>G<cr>", { desc = "Git Status" })
keymap("n", "gh", "<cmd>diffget //2<cr>", { desc = "Gitdiff choose left side" })
keymap(
  "n",
  "gl",
  "<cmd>diffget //3<cr>",
  { desc = "Gitdiff choose right size" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

keymap("n", "<leader>oh", "<cmd>checkhealth<cr>", { desc = "Checkhealth" })
keymap("n", "<leader>oo", "<cmd>only<cr>", { desc = "Only current buffer" })

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

keymap("n", "<leader>sj", "<cmd>split<cr>", { desc = "Split horizontal" })
keymap("n", "<leader>sl", "<cmd>vsplit<cr>", { desc = "Split vertical" })
keymap("n", "<leader>ss", "0v)k$:sort<cr>", { desc = "Sort acronym list" })

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Whitespace

keymap(
  "n",
  "<leader>wr",
  [[mz<cmd>%s/\r//g<cr><cmd>let @/=''<cr>`z]],
  { desc = "Remove Windoz line ending" }
)

keymap(
  "n",
  "<leader>wt",
  [[mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z]],
  { desc = "Convert tab to 2 spaces" }
)

keymap(
  "n",
  "<leader>ww",
  [[mz<cmd>%s/\s\+$//e<cr><cmd>let @/=''<cr>`z]],
  { desc = "Remove line end and trailing white spaces" }
)

keymap(
  "n",
  "<leader>]",
  [[:%s/\[\|\]//g<CR>]],
  { noremap = true, silent = true, desc = "Remove [ and ]" }
)

keymap("n", "<leader>r|", [[:%s/\\s*|\\s*/|/g<CR>]], {
  noremap = true,
  silent = true,
  desc = "Remove whitespace before and after |",
})

keymap(
  "n",
  "<leader>wl",
  "<cmd>g/^\\s*$/d<CR>",
  { desc = "Delete empty lines" }
)
keymap("n", "<leader>|", "<cmd>%s/\t/|/g<CR>", { desc = "Replace \t with |" })

-- ------------------------------------------------------------------------- }}}
-- {{{ x - eXtra quality of life items.

keymap(
  "n",
  "<leader><leader>xf",
  [[<cmd>source %<cr><cmd>echo 'Sourced ' . @%<cr>]],
  { desc = "Source file" }
)

keymap(
  "n",
  "<leader><leader>xl",
  [[<cmd>.lua<cr><cmd>echo 'Current line executed.' . <cr>]],
  { desc = "Source current line." }
)

keymap(
  "v",
  "<leader><leader>xs",
  [[:lua<cr><cmd>echo 'Visual selection executed.'<cr>]],
  { desc = "" }
)

-- ------------------------------------------------------------------------- }}}
-- {{{ y - yank

keymap({ "n", "v", "x" }, "<leader>d", '"+d')
keymap({ "n", "v", "x" }, "<leader>y", '"+y')

-- ------------------------------------------------------------------------- }}}
-- {{{ Snacks

if platform.has_plugin("snacks.nvim") then
  local function with_snacks(fn)
    return function()
      platform.with_plugin("snacks.nvim", "snacks", fn)
    end
  end

  local function toggle_snacks(fn)
    return with_snacks(function(snacks)
      fn(snacks):toggle()
    end)
  end

  keymap(
    "n",
    "<leader>e",
    with_snacks(function(snacks)
      snacks.explorer()
    end),
    { desc = "File Explorer" }
  )

  keymap(
    "n",
    "<leader>fb",
    with_snacks(function(snacks)
      snacks.picker.buffers()
    end),
    { desc = "Buffers" }
  )

  keymap(
    "n",
    "<leader>fc",
    with_snacks(function(snacks)
      snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end),
    { desc = "Find Config File" }
  )

  keymap(
    "n",
    "<leader>ff",
    with_snacks(function(snacks)
      snacks.picker.files()
    end),
    { desc = "Find Files" }
  )
  keymap(
    "n",
    "<leader>fg",
    with_snacks(function(snacks)
      snacks.picker.git_files()
    end),
    { desc = "Find Git Files" }
  )
  keymap(
    "n",
    "<leader>fp",
    with_snacks(function(snacks)
      snacks.picker.projects()
    end),
    { desc = "Projects" }
  )
  keymap(
    "n",
    "<leader>fr",
    with_snacks(function(snacks)
      snacks.picker.recent()
    end),
    { desc = "Recent" }
  )

  -- Git
  keymap(
    "n",
    "<leader>gB",
    with_snacks(function(snacks)
      snacks.gitbrowse()
    end),
    { desc = "Git Browse" }
  )

  keymap(
    "n",
    "<leader>gL",
    with_snacks(function(snacks)
      snacks.picker.git_log_line()
    end),
    { desc = "Git Log Line" }
  )
  -- keymap("n", "<leader>gS", with_snacks(function(snacks) snacks.picker.git_stash() end), { desc = "Git Stash" })
  keymap(
    "n",
    "<leader>gb",
    with_snacks(function(snacks)
      snacks.picker.git_branches()
    end),
    { desc = "Git Branches" }
  )
  keymap(
    "n",
    "<leader>gd",
    with_snacks(function(snacks)
      snacks.picker.git_diff()
    end),
    { desc = "Git Diff (Hunks)" }
  )
  keymap(
    "n",
    "<leader>gf",
    with_snacks(function(snacks)
      snacks.picker.git_log_file()
    end),
    { desc = "Git Log File" }
  )
  keymap(
    "n",
    "<leader>gl",
    with_snacks(function(snacks)
      snacks.picker.git_log()
    end),
    { desc = "Git Log" }
  )

  -- Grep
  keymap(
    "n",
    "<leader>sb",
    with_snacks(function(snacks)
      snacks.picker.lines()
    end),
    { desc = "Buffer Lines" }
  )
  keymap(
    "n",
    "<leader>sB",
    with_snacks(function(snacks)
      snacks.picker.grep_buffers()
    end),
    { desc = "Grep Open Buffers" }
  )
  keymap(
    "n",
    "<leader>sg",
    with_snacks(function(snacks)
      snacks.picker.grep()
    end),
    { desc = "Grep" }
  )
  keymap(
    { "n", "x" },
    "<leader>sw",
    with_snacks(function(snacks)
      snacks.picker.grep_word()
    end),
    { desc = "Visual Word or Selection" }
  )

  -- Search
  keymap(
    "n",
    "<leader>sC",
    with_snacks(function(snacks)
      snacks.picker.commands()
    end),
    { desc = "Commands" }
  )
  keymap(
    "n",
    "<leader>sD",
    with_snacks(function(snacks)
      snacks.picker.diagnostics_buffer()
    end),
    { desc = "Buffer Diagnostics" }
  )
  keymap(
    "n",
    "<leader>sG",
    with_snacks(function(snacks)
      snacks.picker.registers()
    end),
    { desc = "Registers" }
  )
  keymap(
    "n",
    "<leader>sH",
    with_snacks(function(snacks)
      snacks.picker.highlights()
    end),
    { desc = "Highlights" }
  )
  keymap(
    "n",
    "<leader>sM",
    with_snacks(function(snacks)
      snacks.picker.man()
    end),
    { desc = "Man Pages" }
  )
  keymap(
    "n",
    "<leader>sR",
    with_snacks(function(snacks)
      snacks.picker.resume()
    end),
    { desc = "Resume" }
  )
  keymap(
    "n",
    "<leader>sa",
    with_snacks(function(snacks)
      snacks.picker.autocmds()
    end),
    { desc = "Autocmds" }
  )
  keymap(
    "n",
    "<leader>sd",
    with_snacks(function(snacks)
      snacks.picker.diagnostics()
    end),
    { desc = "Diagnostics" }
  )
  keymap(
    "n",
    "<leader>sh",
    with_snacks(function(snacks)
      snacks.picker.help()
    end),
    { desc = "Help Pages" }
  )
  keymap(
    "n",
    "<leader>si",
    with_snacks(function(snacks)
      snacks.picker.icons()
    end),
    { desc = "Icons" }
  )
  keymap(
    "n",
    "<leader>sJ",
    with_snacks(function(snacks)
      snacks.picker.jumps()
    end),
    { desc = "Jumps" }
  )
  keymap(
    "n",
    "<leader>sk",
    with_snacks(function(snacks)
      snacks.picker.keymaps()
    end),
    { desc = "Keymaps" }
  )
  keymap(
    "n",
    "<leader>sL",
    with_snacks(function(snacks)
      snacks.picker.loclist()
    end),
    { desc = "Location List" }
  )
  keymap(
    "n",
    "<leader>sm",
    with_snacks(function(snacks)
      snacks.picker.marks()
    end),
    { desc = "Marks" }
  )
  keymap(
    "n",
    "<leader>sp",
    with_snacks(function(snacks)
      snacks.picker.lazy()
    end),
    { desc = "Plugin Specs" }
  )
  keymap(
    "n",
    "<leader>sq",
    with_snacks(function(snacks)
      snacks.picker.qflist()
    end),
    { desc = "Quickfix List" }
  )
  keymap(
    "n",
    "<leader>su",
    with_snacks(function(snacks)
      snacks.picker.undo()
    end),
    { desc = "Undo History" }
  )
  keymap(
    "n",
    "<leader>s/",
    with_snacks(function(snacks)
      snacks.picker.search_history()
    end),
    { desc = "Search History" }
  )
  keymap(
    "n",
    "<leader>uC",
    with_snacks(function(snacks)
      snacks.picker.colorschemes()
    end),
    { desc = "Colorschemes" }
  )

  -- Toggles
  keymap(
    "n",
    "yoh",
    toggle_snacks(function(snacks)
      return snacks.toggle.inlay_hints()
    end),
    { desc = "Toggle Inlay Hints" }
  )
  keymap(
    "n",
    "yoi",
    toggle_snacks(function(snacks)
      return snacks.toggle.indent()
    end),
    { desc = "Toggle Indent" }
  )
  keymap(
    "n",
    "yon",
    toggle_snacks(function(snacks)
      return snacks.toggle.line_number()
    end),
    { desc = "Toggle Line Numbers" }
  )
  keymap(
    "n",
    "yor",
    toggle_snacks(function(snacks)
      return snacks.toggle.option(
        "relativenumber",
        { name = "Relative Number" }
      )
    end),
    { desc = "Toggle Relative Number" }
  )
  keymap(
    "n",
    "yos",
    toggle_snacks(function(snacks)
      return snacks.toggle.option("spell", { name = "Spelling" })
    end),
    { desc = "Toggle Spelling" }
  )
  keymap(
    "n",
    "yot",
    toggle_snacks(function(snacks)
      return snacks.toggle.treesitter()
    end),
    { desc = "Toggle Treesitter" }
  )
  keymap(
    "n",
    "yow",
    toggle_snacks(function(snacks)
      return snacks.toggle.option("wrap", { name = "Wrap" })
    end),
    { desc = "Toggle Wrap" }
  )
  keymap(
    "n",
    "<leader>ud",
    toggle_snacks(function(snacks)
      return snacks.toggle.diagnostics()
    end),
    { desc = "Toggle Diagnostics" }
  )
  keymap(
    "n",
    "<leader>uc",
    toggle_snacks(function(snacks)
      return snacks.toggle.option(
        "conceallevel",
        { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }
      )
    end),
    { desc = "Toggle Conceallevel" }
  )
  keymap(
    "n",
    "<leader>ub",
    toggle_snacks(function(snacks)
      return snacks.toggle.option(
        "background",
        { off = "light", on = "dark", name = "Dark Background" }
      )
    end),
    { desc = "Toggle Dark Background" }
  )
  keymap(
    "n",
    "<leader>uD",
    toggle_snacks(function(snacks)
      return snacks.toggle.dim()
    end),
    { desc = "Toggle Dim" }
  )

  -- Utilities
  keymap(
    "n",
    "<leader>.",
    with_snacks(function(snacks)
      snacks.scratch.open()
    end),
    { desc = "Toggle Scratch Buffer" }
  )
  keymap(
    "n",
    "<leader>S",
    with_snacks(function(snacks)
      snacks.scratch.select()
    end),
    { desc = "Select Scratch Buffer" }
  )
  -- keymap("n", "<leader>bd", with_snacks(function(snacks) snacks.bufdelete() end), { desc = "Delete Buffer" })
  keymap(
    "n",
    "<leader>cR",
    with_snacks(function(snacks)
      snacks.rename.rename_file()
    end),
    { desc = "Rename File" }
  )
  keymap(
    "n",
    "<leader>un",
    with_snacks(function(snacks)
      snacks.notifier.hide()
    end),
    { desc = "Dismiss All Notifications" }
  )
  keymap(
    { "n", "t" },
    "]]",
    with_snacks(function(snacks)
      snacks.words.jump(vim.v.count1)
    end),
    { desc = "Next Reference" }
  )
  keymap(
    { "n", "t" },
    "[[",
    with_snacks(function(snacks)
      snacks.words.jump(-vim.v.count1)
    end),
    { desc = "Prev Reference" }
  )
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Harpoon

if platform.has_plugin("harpoon") then
  keymap("n", "<a-1>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():select(1)
    end)
  end, { desc = "Harpoon buffer 1" })

  keymap("n", "<a-2>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():select(2)
    end)
  end, { desc = "Harpoon buffer 2" })

  keymap("n", "<a-3>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():select(3)
    end)
  end, { desc = "Harpoon buffer 3" })

  keymap("n", "<a-4>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():select(4)
    end)
  end, { desc = "Harpoon buffer 4" })

  keymap("n", "<a-5>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():next()
    end)
  end, { desc = "Harpoon next buffer" })

  keymap("n", "<a-6>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():prev()
    end)
  end, { desc = "Harpoon prev buffer" })

  keymap("n", "<a-7>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end, { desc = "Harpoon Toggle Menu" })

  keymap("n", "<a-8>", function()
    platform.with_plugin("harpoon", "harpoon", function(harpoon)
      harpoon:list():add()
    end)
  end, { desc = "Harpoon Add file" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Noice

if platform.has_plugin("noice.nvim") then
  keymap("n", "<leader>ne", function()
    platform.with_plugin("noice.nvim", "noice", function(noice)
      noice.cmd("errors")
    end)
  end)

  keymap("n", "<leader>nh", function()
    platform.with_plugin("noice.nvim", "noice", function(noice)
      noice.cmd("history")
    end)
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

if platform.has_plugin("nvim-lspconfig") then
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local opts = { buffer = args.buf }

      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "gD", vim.lsp.buf.declaration, opts)
      keymap("n", "gi", vim.lsp.buf.implementation, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "<leader>k", vim.lsp.buf.signature_help, opts)
      keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      keymap("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "<leader>E", vim.diagnostic.open_float, opts)
      keymap("n", "[d", function()
        vim.diagnostic.jump({ float = true, count = 1, direction = -1 })
      end, opts)
      keymap("n", "]d", function()
        vim.diagnostic.jump({ float = true, count = 1, direction = 1 })
      end, opts)
      keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end,
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ grug-far

if platform.has_plugin("grug-far.nvim") then
  keymap("n", "<leader>sr", function()
    platform.with_loaded_plugin("grug-far.nvim", function()
      vim.cmd("GrugFar")
    end)
  end, { desc = "Scan and Replace" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ img-clip.nvim

if platform.has_plugin("img-clip.nvim") then
  keymap("n", "<leader>pi", function()
    platform.with_loaded_plugin("img-clip.nvim", function()
      vim.cmd("PasteImage")
    end)
  end, { desc = "Save and Paste Image" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ in-and-out.nvim

if platform.has_plugin("in-and-out.nvim") then
  keymap("i", "<c-l>", function()
    platform.with_plugin("in-and-out.nvim", "in-and-out", function(in_and_out)
      in_and_out.in_and_out()
    end)
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ nvim-toggler

if platform.has_plugin("nvim-toggler") then
  keymap({ "n", "v" }, "<leader>tn", function()
    platform.with_plugin("nvim-toggler", "nvim-toggler", function(toggler)
      toggler.toggle()
    end)
  end, { desc = "Toggle operand" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ markdown-preview.nvim

if platform.has_plugin("markdown-preview.nvim") then
  keymap("n", "<leader>mt", function()
    platform.with_loaded_plugin("markdown-preview.nvim", function()
      vim.cmd("MarkdownPreviewToggle")
    end)
  end, { desc = "Markdown Toggle Preview" })

  keymap("n", "<leader>mp", function()
    platform.with_loaded_plugin("markdown-preview.nvim", function()
      vim.cmd("MarkdownPreview")
    end)
  end, { desc = "Markdown Preview" })

  keymap("n", "<leader>ms", function()
    platform.with_loaded_plugin("markdown-preview.nvim", function()
      vim.cmd("MarkdownPreviewStop")
    end)
  end, { desc = "Markdown Stop Preview" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ todo-comments.nvim

if platform.has_plugin("todo-comments.nvim") then
  keymap("n", "<leader>fy", function()
    platform.with_loaded_plugin("todo-comments.nvim", function()
      vim.cmd("Find Todo keywords=YouTube,Youtube,URL,Url")
    end)
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-bundle-plantuml

if platform.has_plugin("vim-bundle-plantuml") then
  keymap("n", "<leader>gu", function()
    platform.with_loaded_plugin("vim-bundle-plantuml", function()
      vim.cmd("PlantUmlAssemble")
    end)
  end)

  keymap("n", "<leader>gv", function()
    platform.with_loaded_plugin("vim-bundle-plantuml", function()
      vim.cmd("PlantUmlView")
    end)
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-dadbod-ui

if platform.has_plugin("vim-dadbod-ui") then
  keymap("n", "<leader>db", function()
    platform.with_loaded_plugin("vim-dadbod-ui", function()
      vim.cmd("DBUIToggle")
    end)
  end, { desc = "Toggle DBUI" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-easy-align

if platform.has_plugin("vim-easy-align") then
  keymap(
    "x",
    "ga",
    "<Plug>(EasyAlign)",
    { desc = "EasyAlign", noremap = false }
  )
  keymap(
    "n",
    "ga",
    "<Plug>(EasyAlign)",
    { desc = "EasyAlign", noremap = false }
  )

  keymap("n", "<bar>", function()
    pcall(vim.cmd, "NoiceDisable")
    vim.opt.cmdheight = 1
    vim.cmd("normal gaip*|")
    vim.opt.cmdheight = 0
    pcall(vim.cmd, "NoiceEnable")
  end, { desc = "EasyAlign gaip*<bar>" })

  keymap("n", "<leader>0", function()
    pcall(vim.cmd, "NoiceDisable")
    vim.opt.cmdheight = 1
    vim.cmd("normal gaip*,")
    vim.opt.cmdheight = 0
    pcall(vim.cmd, "NoiceEnable")
  end, { desc = "EasyAlign gaip=," })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ vimtex

if platform.has_plugin("vimtex") then
  keymap("n", "<leader>lC", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-clean-full)")
    end)
  end)

  keymap("n", "<leader>lG", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-status-all)")
    end)
  end)

  keymap("n", "<leader>lI", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-info-full)")
    end)
  end)

  keymap("n", "<leader>lK", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-stop-all)")
    end)
  end)

  keymap("n", "<leader>lL", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-compile-selected)")
    end)
  end)

  keymap("n", "<leader>lT", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-toc-toggle)")
    end)
  end)

  keymap("n", "<leader>lX", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-reload-state)")
    end)
  end)

  keymap("n", "<leader>la", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-context-menu)")
    end)
  end)

  keymap("n", "<leader>lc", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-clean)")
    end)
  end)

  keymap("n", "<leader>le", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-errors)")
    end)
  end)

  keymap("n", "<leader>lg", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-status)")
    end)
  end)

  keymap("n", "<leader>li", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-info)")
    end)
  end)

  keymap("n", "<leader>lk", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-stop)")
    end)
  end)

  keymap("n", "<leader>ll", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-compile)")
    end)
  end)

  keymap("n", "<leader>lm", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-imaps-list)")
    end)
  end)

  keymap("n", "<leader>lo", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-compile-output)")
    end)
  end)

  keymap("n", "<leader>lq", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-log)")
    end)
  end)

  keymap("n", "<leader>ls", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-toggle-main)")
    end)
  end)

  keymap("n", "<leader>lt", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-toc-open)")
    end)
  end)

  keymap("n", "<leader>lv", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-view)")
    end)
  end)

  keymap("n", "<leader>lx", function()
    platform.with_loaded_plugin("vimtex", function()
      platform.input("<Plug>(vimtex-reload)")
    end)
  end)
end

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
-- {{{ wiki.vim

if platform.has_plugin("wiki.vim") and platform.is_nvim() then
  local wikihome = os.getenv("WIKIHOME")
  local workhome = os.getenv("WORKHOME")
  local ythome = os.getenv("YOUTUBEHOME")

  keymap(
    "n",
    "<leader>pw",
    "<cmd>edit " .. wikihome .. "/index.md<cr>",
    { desc = "Personal Wiki" }
  )
  keymap(
    "n",
    "<leader>wb",
    "<cmd>edit " .. wikihome .. "/journal/Backlog.md<cr>",
    { desc = "Wiki Backlog" }
  )
  keymap(
    "n",
    "<leader>wa",
    "<cmd>edit " .. wikihome .. "/journal/Acronyms.md<cr>",
    { desc = "Wiki Acronyms" }
  )
  keymap(
    "n",
    "<leader>wk",
    "<cmd>edit " .. workhome .. "/Wiki/index.md<cr>",
    { desc = "Work Wiki" }
  )
  keymap(
    "n",
    "<leader>yt",
    "<cmd>edit " .. ythome .. "/wiki/index.md<cr>",
    { desc = "YouTube Wiki" }
  )

  keymap("n", "<leader>we", function()
    platform.with_loaded_plugin("wiki.vim", function()
      vim.cmd("WikiExport")
    end)
  end, { desc = "Wiki Export" })

  keymap(
    "n",
    "<leader>wi",
    "<cmd>edit " .. wikihome .. "/index.md<cr>",
    { desc = "Personal Wiki" }
  )

  keymap("n", "<leader>wj", function()
    platform.with_loaded_plugin("wiki.vim", function()
      vim.cmd("cd " .. wikihome)
      vim.cmd("WikiJournal")
    end)
  end, { desc = "Wiki Journal" })

  keymap("n", "<leader>wp", function()
    platform.with_loaded_plugin("wiki.vim", function()
      vim.cmd("WikiPages")
    end)
  end, { desc = "Wiki Pages" })

  keymap("n", "<leader>wv", function()
    platform.with_loaded_plugin("wiki.vim", function()
      vim.cmd("lua Page_Viewer()")
    end)
  end, { desc = "Wiki View Exported Page" })
end

-- ------------------------------------------------------------------------- }}}
