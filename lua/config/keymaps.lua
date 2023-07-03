-- {{{ Global definitions

require("config.globals")

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
Keymap("n", "<leader>qq", "<cmd>qall!<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ leader + space

Keymap("n", "<leader><space>", "<cmd>nohlsearch<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

Keymap("n", "<leader>HH", "<cmd>silent vert bo help<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ L - LSP

-- TODO: Finish implementing LSP keybindings.  Some plugins are not installed.

-- LSP
Keymap("n", "<leader>LF", "<cmd>LspToggleAutoFormat<cr>")
Keymap("n", "<leader>Li", "<cmd>LspInfo<cr>")

-- LuaSnipUnlinkCurrent
Keymap("n", "<leader>Lu", "<cmd>LuaSnipUnlinkCurrent<cr>")

-- SymoblsOutline
Keymap("n", "<leader>Lo", "<cmd>SymbolsOutline<cr>")

-- Trouble
Keymap("n", "<leader>LR", "<cmd>TroubleToggle lsp_references<cr>")
Keymap("n", "<leader>Ld", "<cmd>TroubleToggle<cr>")

-- vim.diagnostic
Keymap("n", "<leader>Lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
Keymap("n", "<leader>Lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")

-- vim.lsp
Keymap("n", "<leader>Ll", "<cmd>lua vim.lsp.codelens.run()<cr>")
Keymap("n", "<leader>Lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")

-- vim.lsp.buf
Keymap("n", "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>")
Keymap("n", "<leader>Lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>")
Keymap("n", "<leader>Lr", "<cmd>lua vim.lsp.buf.rename()<cr>")

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
-- {{{ D/d - Debug Adapter Protocol (DAP).

if Is_Enabled("nvim-dap") then
  Keymap("n", "<leader>dC", [[<cmd>lua require("dap").run_to_cursor()<cr>]])
  Keymap("n", "<leader>db", [[<cmd>lua require("dap").step_back()<cr>]])
  Keymap("n", "<leader>dc", [[<cmd>lua require("dap").continue()<cr>]])
  Keymap("n", "<leader>dd", [[<cmd>lua require("dap").disconnect()<cr>]])
  Keymap("n", "<leader>dg", [[<cmd>lua require("dap").session()<cr>]])
  Keymap("n", "<leader>di", [[<cmd>lua require("dap").step_into()<cr>]])
  Keymap("n", "<leader>dl", [[<cmd>lua require("dap").open_logfile()<cr>]])
  Keymap("n", "<leader>do", [[<cmd>lua require("dap").step_over()<cr>]])
  Keymap("n", "<leader>dp", [[<cmd>lua require("dap").pause()<cr>]])
  Keymap("n", "<leader>dq", [[<cmd>lua require("dap").close()<cr>]])
  Keymap("n", "<leader>ds", [[<cmd>lua require("dap").continue()<cr>]])
  Keymap("n", "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<cr>]])
  Keymap("n", "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<cr>]])

  Keymap("n", "<leader>dw", [[<cmd>lua require("dap.ui.widgets").hover()<cr>]])
  Keymap("n", "<leader>Dd", [[<cmd>lua require("osv").run_this()<cr>]])
  Keymap(
    "n",
    "<leader>Ds",
    [[<cmd>lua require("osv").launch({ port = 8686})<cr>]]
  )

  Keymap("n", "<F5>", [[<cmd>lua  require("dap").continue()<cr>]])
  Keymap("n", "<F10>", [[<cmd>lua require("dap").step_over()<cr>]])
  Keymap("n", "<F11>", [[<cmd>lua require("dap").step_into()<cr>]])
  Keymap("n", "<F12>", [[<cmd>lua require("dap").step_out()<cr>]])
end

if Is_Enabled("nvim-dap-ui") then
  Keymap("n", "<leader>dU", [[<cmd>lua require("dapui").toggle()<cr>]])
end

-- ------------------------------------------------------------------------- }}}
-- {{{ g - KJV commands

if Is_Enabled("vim-bundle-plantuml") then
  Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram<cr>")
end

Keymap("n", "gk", [[0mMvg_"ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
Keymap("v", "gk", [["ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ n - File explorers

if Is_Enabled("neo-tree.nvim") or Is_Enabled("nvim-tree") then
  -- nvim_tree takes precedence when both are true.
  if Is_Enabled("nvim-tree") then
    Keymap("n", "<c-n>", "<cmd>NvimTreeToggle<cr>")
    Keymap("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>")
    Keymap("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>")
  else
    Keymap("n", "<c-n>", "<cmd>Neotree toggle<cr>")
    Keymap("n", "<leader>nf", "<cmd>Neotree focus<cr>")
    Keymap("n", "<leader>nr", "<cmd>Neotree show<cr>")
  end
end

if Is_Enabled("noice.nvim") then
  Keymap("n", "<leader>ne", "<cmd>NoiceErrors<cr>")
  Keymap("n", "<leader>nh", "<cmd>NoiceHistory<cr>")
end

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

-- ------------------------------------------------------------------------- }}}
