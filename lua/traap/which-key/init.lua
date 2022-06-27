-- {{{ Bail when required packages are not loaded.

local  whichkey_ok, whichkey = pcall(require, 'which-key')
if not whichkey_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

-- vim.g.mapleader = [[ ]]
-- vim.g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Basic Setup

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      -- enabling this will show Which Key when pressing z= to select spelling suggestions
      enabled = true,

      -- how many suggestions should be shown in the list?
      suggestions = 20,
    },

    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },

  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜",  -- symbol used between a key and it's label
    group = "+",      -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = '<c-j>', -- binding to scroll down inside the pop-up
    scroll_up = '<c-k>',   -- binding to scroll up inside the pop-up
  },

  window = {
    border = "none",          -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },

  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
    align = "center",               -- align columns left, center or right
  },

  -- enable this to hide mappings for which you didn't specify a label
  ignore_missing = false,

  -- hide mapping boilerplate
  hidden = {
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<CR>",
    "call",
    "lua",
    "^:",
    "^ "
  },

  show_help = true,          -- show help message on the command line when the pop-up is visible
  triggers = "auto",         -- automatically setup triggers
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by Which Key this is
    -- mostly relevant for key maps that start with a native binding most people
    -- should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ opts

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

-- ------------------------------------------------------------------------- }}}
-- {{{ m_opts

local m_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

-- ------------------------------------------------------------------------- }}}
-- {{{ m_mappings

local m_mappings = {
  a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
  c = { '"+y', "Yank" },
  h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  j = { "<cmd>BookmarkNext<cr>", "Next" },
  k = { "<cmd>BookmarkPrev<cr>", "Prev" },
  m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
  s = { "<cmd>BookmarkShowAll<cr>", "Prev" },
  u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Begin: mappings

local mappings = {

  [" "] =  { "<cmd>nohlsearch<cr>", "No HL" },
  ["Va"] = { 'V`', "Reselect Paste" },
  ["Vb"] = { 'ggvG', "Select entire buffer." },
  ["Vc"] = { 'ggvGg_', "Select entire buffer." },
  ["Vd"] = { '^vg_', "Charwise" },
  ["e"] =  { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"] =  { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },

-- ------------------------------------------------------------------------- }}}
-- {{{ b - Buffers

  b = {
    name = "Buffers",
    b = { "<cmd>lua require('user.bfs').open()<cr>", "List" },
    d = { "<cmd>Bdelete!", "Delete" },
    h = { "<cmd>vertical resize -1<cr>", "Vertical resize -1" },
    j = { "<cmd>resize +1<cr>", "Horizontal resize +1" },
    k = { "<cmd>resize -1<cr>", "Horizondal resize -1" },
    l = { "<cmd>vertical resize +1<cr>", "Vertical resize -1"},
    m = { [[<cmd>luafile $MYVIMRC<cr>]], "Load $MYVIMRC" },
    x = { [[<cmd>w<cr><cmd>luafile %<cr>]], "Write & Luafile Buffer" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ c - Copy & Paste

  c = {
    name = "Copy & Paste",
    c = { 'ggVGg_"+y', "Yank buffer" },
    v = { '+p', "Paste buffer" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ d - Debug

  d = {
    name = "Debug",
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find

  f = {
    name = "Find",
    C = { '<cmd>Telescope commands<cr>', 'Command' },
    M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
    R = { '<cmd>Telescope registers<cr>', 'Registers' },
    b = { '<cmd>Telescope buffers<cr>', "Buffers"},
    F = { '<cmd>Telescope media_files<cr>', 'Media files'},
    c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
    d = { '<cmd>Telescope diagnostics<cr>', 'Diagnostics' },
    f = { '<cmd>Telescope find_files<cr>', "Find files" },
    g = { '<cmd>Telescope live_grep<cr>', 'Find Text'},
    h = { '<cmd>Telescope help_tags<cr>', "Help" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", 'Media' },
    k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
    l = { '<cmd>Telescope resume<cr>', 'Last Search' },
    o = { '<cmd>Telescope oldfiles<cr>', 'Old files'},
    p = { '<cmd>Telescope find_files cwd=~/.local/share/nvim/site/pack/packer<cr>',  ''},
    r = { '<cmd>Telescope oldfiles<cr>', 'Recent File' },
    v = { '<cmd>Telescope find_files cwd=~/git/nvim<cr>', 'NeoVim'},
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ g - git

  g = {
    name = "Git",
    G = {
      name = "Gist",
      a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
      d = { "<cmd>Gist -d<cr>", "Delete" },
      f = { "<cmd>Gist -f<cr>", "Fork" },
      g = { "<cmd>Gist -b<cr>", "Create" },
      l = { "<cmd>Gist -l<cr>", "List" },
      p = { "<cmd>Gist -b -p<cr>", "Create Private" },
    },

    K = {
      name = "KJV",
      k = { [[^"kyg$<cmd>exec 'r!kjv -b -d -w 65' getreg('k')<cr>]], "Get Verse" },
      f = { [[<cmd>v)3><cr>]], "Format Verse" },
    },

    S = {
      name = "Signs",
      R = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
      h = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    },

    T = {
      name = "Telescope",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    },

    c = { "<cmd>G commit<cr>", "Commit" },
    d = { "<cmd>G diff<cr>", "Diff" },
    h = { "<cmd>vert bo help fugitive<cr>", "Help" },
    l = { "<cmd>G log<cr>", "Log" },
    p = { "<cmd>G pull<cr>", "pull" },
    P = { "<cmd>G push<cr>", "push" },
    s = { "<cmd>G<cr>", "Status>" },
    u = { "<cmd>call GenerateUmlDiagram()<cr>", "Status" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ l - LSP

  l = {
    name = "LSP",
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
    w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ n - NvimTree

  n = {
    name = "NvimTree",
    f = { "<cmd>NvimTreeFindFile<cr>", "Find file in Tree" },
    r = { "<cmd>NvimTreeRefresh<cr>", "Refresh" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options

  o = {
    name = "Options",
    h = { '<cmd>chechhealth<cr>', "Check health" },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
    o = { '<cmd>only<cr>', "Only visible." },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ P - Packer

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ r - Repace

  r = {
    name = "Replace & Ruby",
    a = { [[ggdG<cmd>exec 'r!rake build:amber'<cr>]], "Build Amber"},
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
    p = { [[ggdG<cmd>exec 'r!rubocop'<cr>]], "Rubocop"},
    r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts

  s = {
    name = "Split & Sorts",
    h = { "<cmd>split<cr>", "HSplit" },
    v = { "<cmd>vsplit<cr>", "VSplit" },

    -- Sort a list followed by a blank line.
    s = { "0v)k$:sort<cr>", "Acronym Sort" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ t - Terminal & Tmux
  t = {
    name = "Terminal & Tmux",

    c = {
      name = "Start Tmux",
      a = {'<cmd>Dispatch!ao ao<cr>', 'AO'},
      b = {'<cmd>Dispatch!ao bash<cr>', 'Bash'},
      k = {'<cmd>Dispatch!ao kjv<cr>', 'KJV'},
      s = {'<cmd>Dispatch!ao ssh<cr>', 'Ssh'},
      p = {'<cmd>Dispatch!ao soup<cr>', 'Soup'},
      v = {'<cmd>Dispatch!ao vim<cr>', 'Vim'},
      w = {'<cmd>Dispatch!ao wiki<cr>', 'Wiki'},
    },

    k = {
      name = "Kill Tmux",
      a = {'<cmd>Dispatch!tmux kill-session -t ao<cr>', 'AO'},
      b = {'<cmd>Dispatch!tmux kill-session -t bash<cr>', 'Bash'},
      k = {'<cmd>Dispatch!tmux kill-session -t kjv<cr>', 'KJV'},
      s = {'<cmd>Dispatch!tmux kill-session -t ssh<cr>', 'Ssh'},
      p = {'<cmd>Dispatch!tmux kill-session -t soup<cr>', 'Soup'},
      v = {'<cmd>Dispatch!tmux kill-session -t vim<cr>', 'Vim'},
      w = {'<cmd>Dispatch!tmux kill-session -t wiki<cr>', 'Wiki'},
    },

    r = {
      name = 'Runner',
      F = {'<cmd>VtrFocusRunner<cr>', 'Focus Runner'},
      O = {'<cmd>VtrReorientRunner<cr>', 'Reorient Runner'},
      R = {'<cmd>VtrResizeRunner<cr>', 'Resize Runner'},
      S = {'<cmd>VtrSendFile!<cr>', 'Send File'},
      a = {'<cmd>VtrReattachRunner<cr>', 'Reattah Runner'},
      c = {'<cmd>VtrClearRunner<cr>', 'Clear Runner'},
      f = {'<cmd>VtrFlushCommand<cr>', 'Flush Runner'},
      k = {'<cmd>VtrKillRunner<cr>', 'Kill Runner'},
      l = {'<cmd>VtrSendLinesToRunner<cr>', 'Sent Lines'},
      o = {"<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>", 'Open Runner'},
      s = {'<cmd>VtrSendCommandToRunner<cr>', 'Send Command'},
    },

    T = {
      name = "Terminal",
      ["1"] = { ":1ToggleTerm<cr>", "1" },
      ["2"] = { ":2ToggleTerm<cr>", "2" },
      ["3"] = { ":3ToggleTerm<cr>", "3" },
      ["4"] = { ":4ToggleTerm<cr>", "4" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Wiki &  Whitespace

  w = {
    name = "Whitespace",
    a = { "<cmd>edit /home/traap/git/wiki/journal/Acronyms.md<cr>", 'Wiki Acronyms'},
    b = { "<cmd>edit /home/traap/git/wiki/journal/Backlog.md<cr>", 'Wiki Backlog'},
    e = { '<cmd>WikiExport<cr>', 'Wiki Export'},
    p = { '<cmd>WikiFzfPages<cr>', 'Wiki FZF Pages'},
    r = { '<cmd>%s/\r//g<cr>', "Strip Carriage Return"},
    s = { "mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z", "Strip Trailing Whitespace" },
    t = { '<cmd>WikiFzfTags<cr>', 'Wiki FZF Tags'},
    v = { "<cmd>execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &<cr>", 'PDF Viwer'},
    z = { '<cmd>w<cr>', 'Write File' },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ z - Folds

  z = {
    name = 'Fold',
    v = { 'zMzvzz', 'Close current fold.' },
    j = { 'zcjzOzz', 'Close fold & open next.' },
    k = { 'zckzOzz', 'Close fold & open previous.' },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ H - Help

  H = {
    name = "Help",
    H = { "<cmd>silent vert bo help<cr>", "Help in Vertical Split" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ S - SnipRun

  S = {
    name = "SnipRun",
    c = { "<cmd>SnipClose<cr>", "Close" },
    f = { "<cmd>%SnipRun<cr>", "Run File" },
    i = { "<cmd>SnipInfo<cr>", "Info" },
    m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
    r = { "<cmd>SnipReset<cr>", "Reset" },
    t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
    x = { "<cmd>SnipTerminate<cr>", "Terminate" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ T - Treesitter

  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ End: mappings

}

-- ------------------------------------------------------------------------- }}}
-- {{{ vopts

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- ------------------------------------------------------------------------- }}}
-- {{{ vmappings

local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup and register

whichkey.setup(setup)
whichkey.register(mappings, opts)
whichkey.register(vmappings, vopts)
whichkey.register(m_mappings, m_opts)

-- ------------------------------------------------------------------------ }}}
