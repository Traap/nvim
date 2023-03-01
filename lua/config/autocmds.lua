Customize = require("config.customize")
-- {{{ Clear items that make transparency look bad.

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd([[ highlight clear Folded ]])

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"PlenaryTestPopup",
		"alpha",
		"dashboard",
		"fugitive",
		"help",
		"lspinfo",
		"man",
		"mason",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ csv

local csv_group = vim.api.nvim_create_augroup("csv", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	command = "setlocal filetype=csv nowrap textwidth=0",
	group = csv_group,
	pattern = "*.csv",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ format options

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd([[ setlocal formatoptions+=c ]])
		vim.cmd([[ setlocal formatoptions+=j ]])
		vim.cmd([[ setlocal formatoptions+=n ]])
		vim.cmd([[ setlocal formatoptions+=q ]])
		vim.cmd([[ setlocal formatoptions+=r ]])
		vim.cmd([[ setlocal formatoptions-=2 ]])
		vim.cmd([[ setlocal formatoptions-=a ]])
		vim.cmd([[ setlocal formatoptions-=o ]])
		vim.cmd([[ setlocal formatoptions-=t ]])
	end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Goto last location when opening a buffer.

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Highlight on yank

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- ------------------------------------------------------------------------- }}}
-- {{{ json

local json_group = vim.api.nvim_create_augroup("Json", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	command = [[syntax match Comment +\/\/.\+$+]],
	group = json_group,
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
-- {{{ Reload file when necessay.

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- ------------------------------------------------------------------------- }}}
-- {{{ Resize splits when window is resized.

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
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

local tex_group = vim.api.nvim_create_augroup("Tex", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	command = "setlocal filetype=tex",
	group = tex_group,
	pattern = { "*.tex", "*.bbl", "*.bib", "*.texx", "*.texb", "*.cls" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Wiki

local wiki_group = vim.api.nvim_create_augroup("Wiki", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	command = "setlocal foldlevelstart=2 filetype=wiki | WikiEnable",
	group = wiki_group,
	pattern = { "*.md", "*.markdown", "*.wiki" },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ WhiteSpace

local whitespace_group = vim.api.nvim_create_augroup("WhiteSpace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	command = [[%s/\s\+$//e]],
	group = whitespace_group,
})

-- ------------------------------------------------------------------------- }}}
