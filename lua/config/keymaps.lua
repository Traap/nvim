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
-- {{{ TMUX Sessions.

Keymap("n", "<leader>tao",   "<cmd>Dispatch!ao ao<cr>")
Keymap("n", "<leader>tbash", "<cmd>Dispatch!ao bash<cr>")
Keymap("n", "<leader>tkjv",  "<cmd>Dispatch!ao kjv<cr>")
Keymap("n", "<leader>tssh",  "<cmd>Dispatch!ao ssh<cr>")
Keymap("n", "<leader>tsoup", "<cmd>Dispatch!ao soup<cr>")
Keymap("n", "<leader>tvim",  "<cmd>Dispatch!ao vim<cr>")
Keymap("n", "<leader>twiki", "<cmd>Dispatch!ao wiki<cr>")

Keymap("n", "<leader>kao",   "<cmd>Dispatch! tmux kill-session -t ao<cr>")
Keymap("n", "<leader>kbash", "<cmd>Dispatch! tmux kill-session -t bash<cr>")
Keymap("n", "<leader>kkjv",  "<cmd>Dispatch! tmux kill-session -t kjv<cr>")
Keymap("n", "<leader>kssh",  "<cmd>Dispatch! tmux kill-session -t ssh<cr>")
Keymap("n", "<leader>ksoup", "<cmd>Dispatch! tmux kill-session -t soup<cr>")
Keymap("n", "<leader>kvim",  "<cmd>Dispatch! tmux kill-session -t vim<cr>")
Keymap("n", "<leader>kwiki", "<cmd>Dispatch! tmux kill-session -t wiki<cr>")

-- ------------------------------------------------------------------------- }}}
-- {{{ Q/q - Quit

-- Quit all
Keymap("n", "<c-q>", "<cmd>qall!<cr>")
Keymap("n", "<leader>qq", "<cmd>qall!<cr>")

-- Delete current buffer.

if Is_Enabled("vim-bbye") then
  Keymap("n", "Q", "<cmd>Bdelete!<cr>")
end

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

--Telescope
Keymap("n", "<leader>LS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
Keymap("n", "<leader>Ls", "<cmd>Telescope lsp_document_symbols<cr>")

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
-- {{{ a - Alpha

if Is_Enabled("alpha-nvim") then
  Keymap("n", "<leader>aa", "<cmd>Alpha<cr>")
end

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
-- {{{ f - Find

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader>fC", "<cmd>Telescope commands<cr>")
  Keymap("n", "<leader>fF", "<cmd>Telescope media_files<cr>")
  Keymap("n", "<leader>fM", "<cmd>Telescope man_pages<cr>")
  Keymap("n", "<leader>fO", "<cmd>Telescope oldfiles<cr>")
  Keymap("n", "<leader>fR", "<cmd>Telescope registers<cr>")
  Keymap("n", "<leader>fS", "<cmd>Telescope colorscheme<cr>")
  Keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
  Keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
  Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
  Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
  Keymap("n", "<leader>fm", "<cmd>Telescope marks<cr>")
  Keymap(
    "n",
    "<leader>fi",
    "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>"
  )
  Keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
  Keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>")
  Keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
  Keymap("n", "<leader>fp", "<cmd>Telescope planets<cr>")
  Keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
end

if Is_Enabled("todo-comments.nvim") then
  Keymap("n", "<leader>fy", "<cmd>TodoTelescope keywords=Youtube,URL<cr>")
end

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

if Is_Enabled("telescope.nvim") then
  Keymap("n", "<leader>gC", "<cmd>Telescope git_commits<cr>")
  Keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
  Keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>")
end


if Is_Enabled("vim-bundle-plantuml") then
  Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram<cr>")
end

Keymap("n", "gk", [[0mMvg_"ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])
Keymap("v", "gk", [["ky <cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]])

-- ------------------------------------------------------------------------- }}}
-- {{{ l - VimTex

if Is_Enabled("vimtex") then
  Keymap("n", "<leader>lC", "<Plug>(vimtex-clean-full)")
  Keymap("n", "<leader>lG", "<Plug>(vimtex-status-all)")
  Keymap("n", "<leader>lI", "<Plug>(vimtex-info-full)")
  Keymap("n", "<leader>lK", "<Plug>(vimtex-stop-all)")
  Keymap("n", "<leader>lL", "<Plug>(vimtex-compile-selected)")
  Keymap("n", "<leader>lT", "<Plug>(vimtex-toc-toggle)")
  Keymap("n", "<leader>lX", "<Plug>(vimtex-reload-state)")
  Keymap("n", "<leader>la", "<Plug>(vimtex-context-menu)")
  Keymap("n", "<leader>lc", "<Plug>(vimtex-clean-full)")
  Keymap("n", "<leader>le", "<Plug>(vimtex-error)")
  Keymap("n", "<leader>lg", "<Plug>(vimtex-status)")
  Keymap("n", "<leader>li", "<Plug>(vimtex-info)")
  Keymap("n", "<leader>lk", "<Plug>(vimtex-stop)")
  Keymap("n", "<leader>ll", "<Plug>(vimtex-compile)")
  Keymap("n", "<leader>lm", "<Plug>(vimtex-impas-list)")
  Keymap("n", "<leader>lo", "<Plug>(vimtex-compile-output)")
  Keymap("n", "<leader>lq", "<Plug>(vimtex-log)")
  Keymap("n", "<leader>ls", "<Plug>(vimtex-toggle-main)")
  Keymap("n", "<leader>lt", "<Plug>(vimtex-toc_open)")
  Keymap("n", "<leader>lv", "<Plug>(vimtex-view)")
  Keymap("n", "<leader>lx", "<Plug>(vimtex-reload)")
end

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


if Is_Enabled("zen-mode.nvim") then
  Keymap("n", "<leader>oz", [[<cmd>lua require("zen-mode").toggle()<cr>]])
end

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
