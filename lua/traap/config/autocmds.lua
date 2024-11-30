-- {{{ Create autogroup.

local function is_lazyvim_loaded()
  if pcall(require, "lazyvim") then
    return true
  else
    return false
  end
end

local function augroup(name)
  local agName = "traap_"
  if is_lazyvim_loaded() then
    agName = "lazyvim_"
  end
  return vim.api.nvim_create_augroup(agName .. name, { clear = true })
end


-- -------------------------------------------------------------------------- }}}
-- {{{ Automagically close command-line window.

vim.api.nvim_create_autocmd({ "CmdWinEnter"}, {
  group = augroup("cwe"),
  callback = function()
    vim.cmd "quit"
  end,
})

-- -------------------------------------------------------------------------- }}}
-- {{{ Color tweeks when entering a buffer or when colorscheme change.
--
--     https://image-color-picker.com/rgb-color-picker

vim.api.nvim_create_autocmd({"BufWinEnter", "ColorScheme" }, {
  group = augroup("colors"),
  pattern = {"*"},
  callback = function()

    -- NOTE: RGB values found in Tokyonight-night colors.

    -- Better Quick Fix
    vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "BqfPrevieTitle", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "BqfPrevieThumb", { fg="#3b4261"})
    vim.cmd([[ hi link BqfPreviewRange Search ]])

    -- Cmp
    vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { fg="#3b4261"})

    -- Harpoon
    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg="#3b4261"})

    -- LspSaga
    vim.api.nvim_set_hl(0, "LspSagaSignatureHelpBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspSagaCodeActionBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspSagaDefPreviewBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspSagaRenameBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspSagaHoverBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspSagaBorderTitle", { fg="#3b4261"})

    -- NeoTest
    vim.api.nvim_set_hl(0, "NeoTestBorder", { fg="#3b4261"})

    -- Folds
    vim.api.nvim_set_hl(0, "Folded", {fg="#6a79b3"})

    -- Line numbers
    vim.api.nvim_set_hl(0, "LineNr",      {fg="#e0af68"})
    vim.api.nvim_set_hl(0, "ColorColumn", {bg="#3b4261"})
    vim.api.nvim_set_hl(0, "LineNrAbove", {fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LineNrBelow", {fg="#3b4261"})

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeBorder",        { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg="#3b4261"})

    -- Lsp
    vim.api.nvim_set_hl(0, "LspInfoBorder",     { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg="#3b4261"})

    -- Neovim
    vim.api.nvim_set_hl(0, "FloatBorder", { fg="#3b4261"})

    -- Noice
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",                 { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder",           { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCalculator", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline",    { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderFilter",     { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderHelp",       { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderLua",        { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput",      { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderIncRename",  { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceConfirmBorder",                { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoicePopupBorder",                  { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoicePopupmenuBorder",              { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NoiceSplitBorder",                  { fg="#3b4261"})

    -- Notify
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg="#ff0000"})
    vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg="#3b4261"})
    vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { fg="#e0af68"})

    -- Pmenu
    vim.api.nvim_set_hl(0, "Pmenu", { blend=100 } )
    vim.api.nvim_set_hl(0, "PmenuSel",      { fg="#e0af68", bg="#3b4261" } )
    vim.api.nvim_set_hl(0, "PmenuKindSel",  { fg="#e0af68", bg="#3b4261" } )
    vim.api.nvim_set_hl(0, "PmenuEstraSel", { fg="#e0af68", bg="#3b4261" } )

    -- WhichKey
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg="#3b4261"})
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Close some filetypes with <q>.

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "Gru FAR",
    "PlenaryTestPopup",
    "checkhealth",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true }
    )
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Create dir when saving a file when an intermediate directory is missing.

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ csv settings.

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("csv"),
  command = "setlocal filetype=csv nowrap textwidth=0",
  pattern = "*.csv",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable autoformat for all file types.

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("no_autoformat"),
  pattern = { "*", "csv", "sh", "tex", "wtf" },
  callback = function()
    vim.b.autoformat = false
  end,
})


-- ------------------------------------------------------------------------- }}}
-- {{{ Format options

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("formatopts"),
  callback = function()

    -- Add these options.
    vim.cmd([[ setlocal formatoptions+=c ]]) -- Autowrap comments
    vim.cmd([[ setlocal formatoptions+=j ]]) -- Join comment lines when possible
    vim.cmd([[ setlocal formatoptions+=n ]]) -- Format recognizing numbered lists
    vim.cmd([[ setlocal formatoptions+=q ]]) -- Allow format with gq
    vim.cmd([[ setlocal formatoptions+=r ]]) -- Insert autocomment leader
    vim.cmd([[ setlocal formatoptions+=t ]]) -- Auto wrap with text width

    -- Remove these options.
    vim.cmd([[ setlocal formatoptions-=2 ]]) -- Use 2nd line indent when formatting
    vim.cmd([[ setlocal formatoptions-=o ]]) -- Automatic insert comment leader when 'o' or 'O'
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Go to last location when opening a buffer

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Hide colorcolumn

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("hide_cursorcolumn"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "fugitive",
    "git",
    "gitcommit",
    "help",
    "lazy",
    "lspinfo",
    "man",
    "mason",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  command = "setlocal colorcolumn=0"
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ json syntax match

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("json"),
  command = [[syntax match Comment +\/\/.\+$+]],
  pattern = "*.json",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ lspinfo

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("lspinfo_border"),
  pattern = {
    "lspinfo",
  },
  callback = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
    vim.opt_local.bufhiddden = "wipe"
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML automatic commands.

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("plantuml_assemble"),
  command = "PlantUmlAssemble",
  pattern = { "*.puml", "*.wsd" },
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup("plantuml_clear"),
  command = "PlantUmlClear",
  pattern = { "*.puml", "*.wsd" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Resize splits after window resize.

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  -- callback = function()
  --   local current_tab = vim.fn.tabpagenr()
  --   vim.cmd("tabdo wincmd =")
  --   vim.cmd("tabnext " .. current_tab)
  -- end,
  pattern = "*",
  command = "wincmd =",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Remove trailing WhiteSpace

vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[%s/\s\+$//e]],
  group = augroup("whitespace"),
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set spelling for some file types.

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set TeX files types.

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("tex"),
  command = "setlocal filetype=tex",
  pattern = {
    "*.bbl",
    "*.bib",
    "*.cls",
    "*.tex",
    "*.texb",
    "*.texx",
  },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set Wiki file types and enable wiki.

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("wiki"),
  command = "setlocal foldlevelstart=2 filetype=wiki",
  pattern = { "*.md", "*.markdown", "*.wiki" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Vertical help

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("help"),
	pattern = "help",
	callback = function()
		vim.bo.bufhidden = "unload"
		vim.cmd.wincmd("L")
		vim.cmd.wincmd("=")
	end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set SQL comment string

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("sql"),
  pattern = "sql",
  callback = function()
    vim.cmd([[setlocal commentstring=--%s]])
  end,
})

-- ------------------------------------------------------------------------- }}}
