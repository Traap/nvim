-- {{{ local keymap function

local platform = require("traap.core.platform")
local keymap = require("traap.core.keymap").keymap

local function has_plugin(name)
  local ok, config = pcall(require, "lazy.core.config")
  if not ok then
    return false
  end

  local plugin = config.plugins[name]
  return plugin ~= nil and plugin.enabled ~= false
end

local function load_plugin(name)
  if not has_plugin(name) then
    return false
  end

  local ok, lazy = pcall(require, "lazy")
  if not ok then
    return false
  end

  lazy.load({ plugins = { name } })
  return true
end

local function input(keys)
  vim.api.nvim_input(vim.keycode(keys))
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
-- {{{ Snacks

if has_plugin("snacks.nvim") then
  load_plugin("snacks.nvim")

  local ok, snacks = pcall(require, "snacks")
  if ok then
    keymap("n", "<leader>e", function()
      snacks.explorer()
    end, { desc = "File Explorer" })

    keymap("n", "<leader>fb", snacks.picker.buffers, { desc = "Buffers" })

    keymap("n", "<leader>fc", function()
      snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Find Config File" })

    keymap("n", "<leader>ff", snacks.picker.files, { desc = "Find Files" })
    keymap("n", "<leader>fg", snacks.picker.git_files, { desc = "Find Git Files" })
    keymap("n", "<leader>fp", snacks.picker.projects, { desc = "Projects" })
    keymap("n", "<leader>fr", snacks.picker.recent, { desc = "Recent" })

    -- Git
    keymap("n", "<leader>gB", function()
      snacks.gitbrowse()
    end, { desc = "Git Browse" })

    keymap("n", "<leader>gL", snacks.picker.git_log_line, { desc = "Git Log Line" })
    -- keymap("n", "<leader>gS", snacks.picker.git_stash, { desc = "Git Stash" })
    keymap("n", "<leader>gb", snacks.picker.git_branches, { desc = "Git Branches" })
    keymap("n", "<leader>gd", snacks.picker.git_diff, { desc = "Git Diff (Hunks)" })
    keymap("n", "<leader>gf", snacks.picker.git_log_file, { desc = "Git Log File" })
    keymap("n", "<leader>gl", snacks.picker.git_log, { desc = "Git Log" })

    -- Grep
    keymap("n", "<leader>sb", snacks.picker.lines, { desc = "Buffer Lines" })
    keymap("n", "<leader>sB", snacks.picker.grep_buffers, { desc = "Grep Open Buffers" })
    keymap("n", "<leader>sg", snacks.picker.grep, { desc = "Grep" })
    keymap({ "n", "x" }, "<leader>sw", snacks.picker.grep_word, { desc = "Visual Word or Selection" })

    -- Search
    keymap("n", "<leader>sC", snacks.picker.commands, { desc = "Commands" })
    keymap("n", "<leader>sD", snacks.picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
    keymap("n", "<leader>sH", snacks.picker.highlights, { desc = "Highlights" })
    keymap("n", "<leader>sM", snacks.picker.man, { desc = "Man Pages" })
    keymap("n", "<leader>sR", snacks.picker.resume, { desc = "Resume" })
    keymap("n", "<leader>sa", snacks.picker.autocmds, { desc = "Autocmds" })
    keymap("n", "<leader>sd", snacks.picker.diagnostics, { desc = "Diagnostics" })
    keymap("n", "<leader>sh", snacks.picker.help, { desc = "Help Pages" })
    keymap("n", "<leader>si", snacks.picker.icons, { desc = "Icons" })
    keymap("n", "<leader>sj", snacks.picker.jumps, { desc = "Jumps" })
    keymap("n", "<leader>sk", snacks.picker.keymaps, { desc = "Keymaps" })
    keymap("n", "<leader>sl", snacks.picker.loclist, { desc = "Location List" })
    keymap("n", "<leader>sm", snacks.picker.marks, { desc = "Marks" })
    keymap("n", "<leader>sp", snacks.picker.lazy, { desc = "Plugin Specs" })
    keymap("n", "<leader>sq", snacks.picker.qflist, { desc = "Quickfix List" })
    keymap("n", "<leader>su", snacks.picker.undo, { desc = "Undo History" })
    keymap("n", "<leader>s/", snacks.picker.search_history, { desc = "Search History" })
    -- keymap("n", "<leader>sr", snacks.picker.registers, { desc = "Registers" })
    keymap("n", "<leader>uC", snacks.picker.colorschemes, { desc = "Colorschemes" })

    -- Toggles
    snacks.toggle.inlay_hints():map("yoh")
    snacks.toggle.indent():map("yoi")
    snacks.toggle.line_number():map("yon")
    snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("yor")
    snacks.toggle.option("spell", { name = "Spelling" }):map("yos")
    snacks.toggle.treesitter():map("yot")
    snacks.toggle.option("wrap", { name = "Wrap" }):map("yow")
    snacks.toggle.diagnostics():map("<leader>ud")
    snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
      "<leader>uc")
    snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    snacks.toggle.dim():map("<leader>uD")

    -- Utilities
    keymap("n", "<leader>.", snacks.scratch.open, { desc = "Toggle Scratch Buffer" })
    keymap("n", "<leader>S", snacks.scratch.select, { desc = "Select Scratch Buffer" })
    -- keymap("n", "<leader>bd", snacks.bufdelete, { desc = "Delete Buffer" })
    keymap("n", "<leader>cR", snacks.rename.rename_file, { desc = "Rename File" })
    keymap("n", "<leader>un", snacks.notifier.hide, { desc = "Dismiss All Notifications" })
    keymap({ "n", "t" }, "]]", function() snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
    keymap({ "n", "t" }, "[[", function() snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Harpoon

if has_plugin("harpoon") then
  load_plugin("harpoon")

  local ok, harpoon = pcall(require, "harpoon")
  if ok then
    keymap("n", "<a-1>", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon buffer 1" })

    keymap("n", "<a-2>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon buffer 2" })

    keymap("n", "<a-3>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon buffer 3" })

    keymap("n", "<a-4>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon buffer 4" })

    keymap("n", "<a-5>", function()
      harpoon:list():next()
    end, { desc = "Harpoon next buffer" })

    keymap("n", "<a-6>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon prev buffer" })

    keymap("n", "<a-7>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Toggle Menu" })

    keymap("n", "<a-8>", function()
      harpoon:list():add()
    end, { desc = "Harpoon Add file" })
  end
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Noice

if has_plugin("noice.nvim") then
  keymap("n", "<leader>ne", function()
    if load_plugin("noice.nvim") then
      vim.cmd("NoiceErrors")
    end
  end)

  keymap("n", "<leader>nh", function()
    if load_plugin("noice.nvim") then
      vim.cmd("NoiceHistory")
    end
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP

if has_plugin("nvim-lspconfig") then
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
      keymap("n", "[d", function() vim.diagnostic.jump({ float = true, count = 1, direction = -1 }) end, opts)
      keymap("n", "]d", function() vim.diagnostic.jump({ float = true, count = 1, direction = 1 }) end, opts)
      keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end,
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ grug-far

if has_plugin("grug-far.nvim") then
  keymap("n", "<leader>sr", function()
    if load_plugin("grug-far.nvim") then
      vim.cmd("GrugFar")
    end
  end, { desc = "Scan and Replace" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ img-clip.nvim

if has_plugin("img-clip.nvim") then
  keymap("n", "<leader>pi", function()
    if load_plugin("img-clip.nvim") then
      vim.cmd("PasteImage")
    end
  end, { desc = "Save and Paste Image" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ in-and-out.nvim

if has_plugin("in-and-out.nvim") then
  keymap("i", "<c-l>", function()
    if load_plugin("in-and-out.nvim") then
      require("in-and-out").in_and_out()
    end
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ nvim-toggler

if has_plugin("nvim-toggler") then
  keymap({ "n", "v" }, "<leader>tn", function()
    if load_plugin("nvim-toggler") then
      require("nvim-toggler").toggle()
    end
  end, { desc = "Toggle operand" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ markdown-preview.nvim

if has_plugin("markdown-preview.nvim") then
  keymap("n", "<leader>mt", function()
    if load_plugin("markdown-preview.nvim") then
      vim.cmd("MarkdownPreviewToggle")
    end
  end, { desc = "Markdown Toggle Preview" })

  keymap("n", "<leader>mp", function()
    if load_plugin("markdown-preview.nvim") then
      vim.cmd("MarkdownPreview")
    end
  end, { desc = "Markdown Preview" })

  keymap("n", "<leader>ms", function()
    if load_plugin("markdown-preview.nvim") then
      vim.cmd("MarkdownPreviewStop")
    end
  end, { desc = "Markdown Stop Preview" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ todo-comments.nvim

if has_plugin("todo-comments.nvim") then
  keymap("n", "<leader>fy", function()
    if load_plugin("todo-comments.nvim") then
      vim.cmd("Find Todo keywords=YouTube,Youtube,URL,Url")
    end
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-bundle-plantuml

if has_plugin("vim-bundle-plantuml") then
  keymap("n", "<leader>gu", function()
    if load_plugin("vim-bundle-plantuml") then
      vim.cmd("PlantUmlAssemble")
    end
  end)

  keymap("n", "<leader>gv", function()
    if load_plugin("vim-bundle-plantuml") then
      vim.cmd("PlantUmlView")
    end
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-dadbod-ui

if has_plugin("vim-dadbod-ui") then
  keymap("n", "<leader>db", function()
    if load_plugin("vim-dadbod-ui") then
      vim.cmd("DBUIToggle")
    end
  end, { desc = "Toggle DBUI" })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vim-easy-align

if has_plugin("vim-easy-align") then
  keymap("x", "ga", function()
    if load_plugin("vim-easy-align") then
      input("<Plug>(EasyAlign)")
    end
  end, { desc = "EasyAlign" })

  keymap("n", "ga", function()
    if load_plugin("vim-easy-align") then
      input("<Plug>(EasyAlign)")
    end
  end, { desc = "EasyAlign" })

  keymap("n", "<bar>", function()
    if load_plugin("vim-easy-align") then
      pcall(vim.cmd, "NoiceDisable")
      vim.opt.cmdheight = 1
      vim.cmd("normal gaip*|")
      vim.opt.cmdheight = 0
      pcall(vim.cmd, "NoiceEnable")
    end
  end, { desc = "EasyAlign gaip*<bar>" })

  keymap("n", "<leader>0", function()
    if load_plugin("vim-easy-align") then
      pcall(vim.cmd, "NoiceDisable")
      vim.opt.cmdheight = 1
      vim.cmd("normal gaip*,")
      vim.opt.cmdheight = 0
      pcall(vim.cmd, "NoiceEnable")
    end
  end, { desc = "EasyAlign gaip=," })

  keymap("n", "<leader>1", function()
    if load_plugin("vim-easy-align") then
      pcall(vim.cmd, "NoiceDisable")
      vim.opt.cmdheight = 1
      vim.cmd("normal gaip=,")
      vim.opt.cmdheight = 0
      pcall(vim.cmd, "NoiceEnable")
    end
  end, { desc = "EasyAlign gaip=," })

  keymap("n", "<leader>2", function()
    if load_plugin("vim-easy-align") then
      pcall(vim.cmd, "NoiceDisable")
      vim.opt.cmdheight = 1
      vim.cmd("normal gaip= ")
      vim.opt.cmdheight = 0
      pcall(vim.cmd, "NoiceDisable")
    end
  end, { desc = "EasyAlign gaip=<space>" })
end
-- ------------------------------------------------------------------------- }}}
-- {{{ vim-tmux-navigator

if has_plugin("vim-tmux-navigator") then
  load_plugin("vim-tmux-navigator")

  keymap("n", "<c-h>", function()
    vim.cmd("TmuxNavigateLeft")
  end)

  keymap("n", "<c-j>", function()
    vim.cmd("TmuxNavigateDown")
  end)

  keymap("n", "<c-k>", function()
    vim.cmd("TmuxNavigateUp")
  end)

  keymap("n", "<c-l>", function()
    vim.cmd("TmuxNavigateRight")
  end)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ vimtex

if has_plugin("vimtex") then
  keymap("n", "<leader>lC", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-clean-full)")
    end
  end)

  keymap("n", "<leader>lG", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-status-all)")
    end
  end)

  keymap("n", "<leader>lI", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-info-full)")
    end
  end)

  keymap("n", "<leader>lK", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-stop-all)")
    end
  end)

  keymap("n", "<leader>lL", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-compile-selected)")
    end
  end)

  keymap("n", "<leader>lT", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-toc-toggle)")
    end
  end)

  keymap("n", "<leader>lX", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-reload-state)")
    end
  end)

  keymap("n", "<leader>la", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-context-menu)")
    end
  end)

  keymap("n", "<leader>lc", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-clean-full)")
    end
  end)

  keymap("n", "<leader>le", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-error)")
    end
  end)

  keymap("n", "<leader>lg", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-status)")
    end
  end)

  keymap("n", "<leader>li", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-info)")
    end
  end)

  keymap("n", "<leader>lk", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-stop)")
    end
  end)

  keymap("n", "<leader>ll", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-compile)")
    end
  end)

  keymap("n", "<leader>lm", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-impas-list)")
    end
  end)

  keymap("n", "<leader>lo", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-compile-output)")
    end
  end)

  keymap("n", "<leader>lq", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-log)")
    end
  end)

  keymap("n", "<leader>ls", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-toggle-main)")
    end
  end)

  keymap("n", "<leader>lt", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-toc_open)")
    end
  end)

  keymap("n", "<leader>lv", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-view)")
    end
  end)

  keymap("n", "<leader>lx", function()
    if load_plugin("vimtex") then
      input("<Plug>(vimtex-reload)")
    end
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

if has_plugin("wiki.vim") then
  local wikihome = os.getenv("WIKIHOME")
  local workhome = os.getenv("WORKHOME")
  local ythome = os.getenv("YOUTUBEHOME")

  keymap("n", "<leader>pw", "<cmd>edit " .. wikihome .. "/index.md<cr>", { desc = "Personal Wiki" })
  keymap("n", "<leader>wb", "<cmd>edit " .. wikihome .. "/journal/Backlog.md<cr>", { desc = "Wiki Backlog" })
  keymap("n", "<leader>wa", "<cmd>edit " .. wikihome .. "/journal/Acronyms.md<cr>", { desc = "Wiki Acronyms" })
  keymap("n", "<leader>wk", "<cmd>edit " .. workhome .. "/Wiki/index.md<cr>", { desc = "Work Wiki" })
  keymap("n", "<leader>yt", "<cmd>edit " .. ythome .. "/wiki/index.md<cr>", { desc = "YouTube Wiki" })

  keymap("n", "<leader>we", function()
    if load_plugin("wiki.vim") then
      vim.cmd("WikiExport")
    end
  end, { desc = "Wiki Export" })

  keymap("n", "<leader>wi", "<cmd>edit " .. wikihome .. "/index.md<cr>", { desc = "Personal Wiki" })

  keymap("n", "<leader>wj", function()
    if load_plugin("wiki.vim") then
      vim.cmd("cd " .. wikihome)
      vim.cmd("WikiJournal")
    end
  end, { desc = "Wiki Journal" })

  keymap("n", "<leader>wp", function()
    if load_plugin("wiki.vim") then
      vim.cmd("WikiFzfPages")
    end
  end, { desc = "Wiki FzF Pages" })

  keymap("n", "<leader>wv", function()
    if load_plugin("wiki.vim") then
      vim.cmd("lua Page_Viewer()")
    end
  end, { desc = "Wiki View Exported Page" })
end

-- ------------------------------------------------------------------------- }}}
