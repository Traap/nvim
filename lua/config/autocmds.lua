Customize = require("config.customize")
Functions = require("config.functions")

-- {{{ Create autogroup.
--     NOTE: Found in lazy.vim auto commands.

local function augroup(name)
  return vim.api.nvim_create_augroup("nvimtraap_" .. name, { clear = true })
end

-- -------------------------------------------------------------------------- }}}
-- {{{ Clear items that make transparency look bad.

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("transparency"),
  callback = function()
    vim.cmd([[ highlight clear Folded ]])
    vim.cmd([[ highlight Folded guibg=comment ]])

    vim.cmd([[ highlight clear CursorLineFold ]])
    vim.cmd([[ highlight CursorLineFold guifg=#e0af68 ]])

    if Customize.virtcolumn_nvim then
      vim.cmd([[ highlight ColorColumn guibg=#292d42 ]])
    else
      vim.cmd([[ highlight ColorColumn guibg=#202031 ]])
    end

    vim.cmd([[ highlight LineNr guifg=#e0af68 ]])
    vim.cmd([[ highlight LineNrAbove guifg=#787c99 ]])
    vim.cmd([[ highlight LineNrBelow guifg=#787c99 ]])
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Close some filetypes with <q>.
--     NOTE:  Built into Lazy.vim but I extend the pattern.

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = { "fugitive" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true }
    )
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ csv

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal filetype=csv nowrap textwidth=0",
  group = augroup("csv"),
  pattern = "*.csv",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Disable autoformat for all file types.
-- TODO: Figure out why spaces are replaced with tabs.  Looks like null-ls?

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*", "csv", "md", "sh", "tex", "wiki", "wtf" },
  group = augroup("no_autoformat"),
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
-- {{{ json

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = [[syntax match Comment +\/\/.\+$+]],
  group = augroup("json"),
  pattern = "*.json",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ PlantUML

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "call InitUmlSettings()",
  pattern = { "*.puml", "*.wsd" },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  command = "call GenerateUmlDiagram()",
  pattern = { "*.puml", "*.wsd" },
})

vim.api.nvim_create_autocmd("BufLeave", {
  command = "call ClearUmlLaunchFlag()",
  pattern = { "*.puml", "*.wsd" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Set spelling for some file types.

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "wiki" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ TeX

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal filetype=tex",
  group = augroup("tex"),
  pattern = { "*.tex", "*.bbl", "*.bib", "*.texx", "*.texb", "*.cls" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal foldlevelstart=2 filetype=wiki | WikiEnable",
  group = augroup("wiki"),
  pattern = { "*.md", "*.markdown", "*.wiki" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ WhiteSpace

vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[%s/\s\+$//e]],
  group = augroup("whitespace"),
})

-- ------------------------------------------------------------------------- }}}
