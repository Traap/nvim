return {
	-- {{{ startup time

	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		enabled = function()
			return require("config.customize").vim_startuptime
		end,
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundler

	{
		"tpope/vim-bundler",
		ft = { "rb" },
		enabled = function()
			return require("config.customize").vim_bundler
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bbye

	{
		"moll/vim-bbye",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return require("config.customize").vim_bbye
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-eunuch

	{
		"tpope/vim-eunuch",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return require("config.customize").vim_eunuch
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-fugitive

	{
		"tpope/vim-fugitive",
		lazy = false,
		priority = 999,
		enabled = function()
			return require("config.customize").vim_fugitive
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rails

	{
		"tpope/vim-rails",
		ft = "rb",
		enabled = function()
			return require("config.customize").vim_rails
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rake

	{
		"tpope/vim-rake",
		ft = "rb",
		enabled = function()
			return require("config.customize").vim_rake
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rbven

	{
		"tpope/vim-rbenv",
		ft = "rb",
		enabled = function()
			return require("config.customize").vim_rbenv
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ toggleterm.nvim

	{
		"akinsho/toggleterm.nvim",
		enabled = function()
			return require("config.customize").toggleterm_nvim
		end,
		version = "*",
		opts = {
			size = 13,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = "1",
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
		},
		keys = {
			{
				"<leader>Tf",
				"<leader>Tl",
				"<leader>Tr",
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ zen-mode.nvim

	{
		"folke/zen-mode.nvim",
		enabled = function()
			return require("config.customize").zen_mode_nvim
		end,
		opts = {
			window = {
				width = 0.5,
				height = 0.85,
				options = {
					colorcolumn = "",
					cursorcolumn = false,
					cursorline = false,
					number = true,
					relativenumber = true,
				},
			},
			plugins = {
				enabled = true,
				options = {
					ruler = false,
					showmd = true,
				},
				twilight = { enabled = false },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
				alacritty = {
					enabled = true,
					font = "15",
				},
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
