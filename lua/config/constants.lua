local Constants = {}

-- {{{ Begin Constants table.  These are items used through out Neovim.

Constants = {

	-- ------------------------------------------------------------------------- }}}
	-- {{{ Language Server Protocol (LSP) Names.

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},

	ensure_installed = {
		lsp_config = {
			"bashls",
			"clangd",
			"cssls",
			"diagnosticls",
			"emmet_ls",
			"eslint",
			"gopls",
			"html",
			"jsonls",
			"lua_ls",
			"omnisharp",
			"pyright",
			"rust_analyzer",
			"solargraph",
			"sqlls",
			"texlab",
			"tsserver",
			"yamlls",
		},
		mason = {
			"bash-language-server",
			"clangd",
			"css-lsp",
			"emmet-ls",
			"eslint-lsp",
			"flake8",
			"gopls",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"omnisharp",
			"pyright",
			"rust-analyzer",
			"shellcheck",
			"shfmt",
			"solargraph",
			"sqlls",
			"stylua",
			"texlab",
			"typescript-language-server",
			"yaml-language-server",
		},
	},

	-- ------------------------------------------------------------------------- }}}
	-- {{{ icons

	icons = {
		lsp_kinds = {
			Class = "",
			Color = "",
			Constant = "",
			Constructor = "",
			Enum = "",
			EnumMember = "",
			Event = "",
			Field = "",
			File = "",
			Folder = "",
			Function = "",
			Interface = "",
			Keyword = "",
			Method = "",
			Module = "",
			Operator = "",
			Property = "",
			Reference = "",
			Snippet = " ",
			Struct = "",
			Text = "",
			TypeParameter = "",
			Unit = "",
			Value = "",
			Variable = "",
			buffer = "﬘ ",
			calc = " ",
			nvim_lsp = " ",
			path = " ",
			spell = " ",
			vsnip = " ",
		},
		diagnostic = {
			Error = "",
			Hint = "",
			Info = "",
			Warn = "",
		},
		git = {
			added = " ",
			modified = " ",
			removed = " ",
		},
	},

	-- ------------------------------------------------------------------------- }}}
	-- {{{ Display boarders

	display_border = { border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } },

	-- ------------------------------------------------------------------------- }}}
	-- {{{ keybinding options

	keybind_opts = {
		normal = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>", -- Override this value.
			buffer = nil, -- Global mappings. Specify a buffer number for buffer
			--   local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},

		visual = {
			mode = "v", -- VISUAL mode
			prefix = "<leader>", -- Override this value.
			buffer = nil, -- Global mappings. Specify a buffer number for buffer
			-- local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		},
	},

	-- ------------------------------------------------------------------------- }}}
	-- {{{ Completion source mapping

	completion = {
		source_mapping = {
			buffer = "[Buffer]",
			latex_symbols = "[LaTeX]",
			luasnip = "[Snippet]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[Lua]",
			path = "[Path]",
			spell = "[Spell]",
		},

		sources = {
			{ name = "buffer", keyword_length = 2, max_item_count = 30 },
			{ name = "calc", keyword_length = 2, max_item_count = 30 },
			{ name = "latex_symbols", keyword_length = 1, max_item_count = 30 },
			{ name = "luasnip", keyword_length = 1, max_item_count = 30 },
			{ name = "nvim_lsp", keyword_length = 2, max_item_count = 30 },
			{ name = "nvim_lua", keyword_length = 1, max_item_count = 30 },
			{ name = "path", keyword_length = 3, max_item_count = 30 },
			{ name = "spell", keyword_length = 2, max_item_count = 30 },
		},
	},
	-- ------------------------------------------------------------------------- }}}
	-- {{{ Treesitter

	treesitter_languages = {
		"bash",
		"c",
		"c_sharp",
		"cpp",
		"dockerfile",
		"help",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"ruby",
		"rust",
		"sql",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},

	-- ------------------------------------------------------------------------- }}}
	-- {{{ End Constants table.
}
-- ------------------------------------------------------------------------- }}}

return Constants
