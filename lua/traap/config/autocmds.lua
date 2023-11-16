require("traap.core.globals")

-- {{{ Create autogroup.
--     NOTE: Found in lazy.vim auto commands.

local function augroup(name)
  return vim.api.nvim_create_augroup("nvimtraap_" .. name, { clear = true })
end

-- -------------------------------------------------------------------------- }}}
-- {{{ Color tweeks when entering a buffer or when colorscheme change.
--
--     https://image-color-picker.com/rgb-color-picker

vim.api.nvim_create_autocmd({"VimEnter", "BufEnter", "ColorScheme"}, {
  group = augroup("transparency"),
  callback = function()
    if Is_Enabled("virtcolumn.nvim")  then
      vim.cmd([[ highlight ColorColumn guibg=#292d42 ]])
    else
      vim.cmd([[ highlight ColorColumn guibg=#202031 ]])
    end

    vim.cmd([[ highlight clear Folded ]])
    vim.cmd([[ highlight Folded guibg=comment guifg=#6a79b3 ]])

    vim.cmd([[ highlight LineNr guifg=#e0af68 ]])
    vim.cmd([[ highlight LineNrAbove guifg=#787c99 ]])
    vim.cmd([[ highlight LineNrBelow guifg=#787c99 ]])

    vim.cmd([[ highlight TelescopeBorder guifg=#5f5c6d ]])

    vim.opt.pumblend=0
    vim.cmd([[ highlight Pmenu guibg=comment ]])

  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Close some filetypes with <q>.

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "fugitive",
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
  pattern = { "*", "csv", "md", "sh", "tex", "wiki", "wtf" },
  callback = function()
    vim.b.autoformat = false
  end,
})


-- ------------------------------------------------------------------------- }}}
-- {{{ Format options

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()

    -- Add these options.
    vim.cmd([[ setlocal formatoptions+=c ]]) -- Autowrap comments
    vim.cmd([[ setlocal formatoptions+=j ]]) -- Join comment lines when possible
    vim.cmd([[ setlocal formatoptions+=n ]]) -- Format recognizing numbered lists
    vim.cmd([[ setlocal formatoptions+=q ]]) -- Allow format with gq
    vim.cmd([[ setlocal formatoptions+=r ]]) -- Insert autocomment leader

    -- Remove these options.
    vim.cmd([[ setlocal formatoptions-=2 ]]) -- Use 2nd line indent when formatting
    vim.cmd([[ setlocal formatoptions-=a ]]) -- Automatic paragraph formatting
    vim.cmd([[ setlocal formatoptions-=o ]]) -- Automatic insert comment leader when 'o' or 'O'
    vim.cmd([[ setlocal formatoptions-=t ]]) -- Auto wrap with text width
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
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("wiki"),
  command = "setlocal foldlevelstart=2 filetype=wiki | WikiEnable",
  pattern = { "*.md", "*.markdown", "*.wiki" },
})

-- ------------------------------------------------------------------------- }}}
