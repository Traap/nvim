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

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  group = augroup("cwe"),
  callback = function()
    vim.cmd "quit"
  end,
})

-- -------------------------------------------------------------------------- }}}
-- {{{ Color tweeks when entering a buffer or when colorscheme change.
--
--     https://image-color-picker.com/rgb-color-picker
--     Note: Normally I use 3b4261 most settings found here.

vim.api.nvim_create_autocmd({ "BufWinEnter", "ColorScheme" }, {
  group = augroup("colors"),
  pattern = { "*" },
  callback = function()
    -- NOTE: RGB values found in Tokyonight-night colors.

    -- Better Quick Fix
    vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "BqfPrevieTitle", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "BqfPrevieThumb", { fg = "#bb9af7" })
    vim.cmd([[ hi link BqfPreviewRange Search ]])

    -- Cmp
    vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { fg = "#bb9af7" })

    -- Harpoon
    vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#bb9af7" })

    -- LspSaga
    vim.api.nvim_set_hl(0, "LspSagaSignatureHelpBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspSagaCodeActionBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspSagaDefPreviewBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspSagaRenameBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspSagaHoverBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspSagaBorderTitle", { fg = "#bb9af7" })

    -- NeoTest
    vim.api.nvim_set_hl(0, "NeoTestBorder", { fg = "#bb9af7" })

    -- Folds
    vim.api.nvim_set_hl(0, "Folded", { fg = "#6a79b3" })

    -- Line numbers
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#e0af68" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3b4261" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#bb9af7" })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#bb9af7" })

    -- Lsp
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = "#bb9af7" })

    -- Neovim
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#bb9af7" })

    -- Noice
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(
      0,
      "NoiceCmdlinePopupBorderCalculator",
      { fg = "#bb9af7" }
    )
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderFilter", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderHelp", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderLua", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(
      0,
      "NoiceCmdlinePopupBorderIncRename",
      { fg = "#bb9af7" }
    )
    vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NoiceSplitBorder", { fg = "#bb9af7" })

    -- Notify
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#ff0000" })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#e0af68" })

    -- Pmenu
    vim.api.nvim_set_hl(0, "Pmenu", { blend = 100 })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#e0af68", bg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#e0af68", bg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "PmenuEstraSel", { fg = "#e0af68", bg = "#bb9af7" })

    -- Snacks
    vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "SnacksPickerBoxBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "SnacksPickerListBorder", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "SnacksPreviewListBorder", { fg = "#bb9af7" })

    -- WhichKey
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#bb9af7" })
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
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Create dir when saving a file when an intermediate directory is missing.

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    -- skip special buffers (fugitive, help, etc.)
    if vim.bo[event.buf].buftype ~= "" then
      return
    end
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
  pattern = { "csv", "sh", "tex" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Format options

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("formatopts"),
  pattern = {
    "*.c",
    "*.cpp",
    "*.cs",
    "*.go",
    "*.html",
    "*.java",
    "*.json",
    "*.lua",
    "*.md",
    "*.py",
    "*.rb",
    "*.rs",
    "*.sh",
    "*.sql",
    "*.tex",
    "*.toml",
    "*.ts",
    "*.tsx",
    "*.vim",
    "*.yaml",
  },
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
    local exclude = { "gitcommit", "fugitive" }
    local buf = event.buf
    if
        vim.tbl_contains(exclude, vim.bo[buf].filetype)
        or vim.b[buf].lazyvim_last_loc
    then
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
  command = "setlocal colorcolumn=0",
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
  pattern = "*",
  command = "wincmd =",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Remove trailing WhiteSpace

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("whitespace"),
  callback = function(args)
    -- skip special buffers
    if vim.bo[args.buf].buftype ~= "" then
      return
    end
    vim.cmd([[ %s/\s\+$//e ]])
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set spelling for some file types.

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit" },
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
