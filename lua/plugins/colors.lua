Customize = require("config.customize")

return {
	-- {{{ nvim-base16

	{
		"RRethy/nvim-base16",
		enabled = function()
			return Customize.nvim_base16
		end,
		lazy = false,
		priority = 1000,

		config = function()
			vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ tokyonight.nvim

	{
		"folke/tokyonight.nvim",
		enabled = function()
			return Customize.tokyonight_nvim
		end,
		lazy = false,
		opts = {
			style = "night",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ catppuccin/nvim

	{
		"catppuccin/nvim",
		enabled = function()
			return Customize.catppuccin
		end,
		lazy = true,
		name = "catppuccin",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-colorizer

	{
		"NvChad/nvim-colorizer.lua",
		enabled = function()
			return Customize.nvim_colorizer_lua
		end,
		event = "VeryLazy",
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-transpartent

	{
		"xiyaowong/nvim-transparent",
		enabled = function()
			return Customize.nvim_transparent
		end,
		lazy = true,
		event = "VimEnter",
		opts = {
			enable = true,
			"Comment",
			extra_gropus = {
				"CursorLine",
				"CursorLineNr",
				"CursorLineSign",
				"Folded",
				"LineNr",
				"Normal",
				"SignColumn",
			},
			exclude = {
				"ColorColumn",
				"EndOfBuffer",
				"NonText",
			},
		},
		config = function()
			vim.cmd([[TransparentEnable]])
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.nvim_treesitter
		end,
		version = false,
		build = ":TSUpdate",

		opts = {
			autopairs = { enable = true },
			autotag = { enable = true, disable = { "xml" } },
			context_commenting = { enable = true, enable_autocmd = false },
			highlight = {
				enable = true,
				disable = {
					"css",
					"latex",
					"markdown",
				},
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true, disable = { "yml", "yaml" } },
			playground = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 1500,
				colors = {
					"Gold",
					"Orchid",
					"DodgerBlue",
					"Cornsilk",
					"Salmon",
					"LawnGreen",
				},
			},
			disable = { "latex" },
			ensure_installed = require("config.constants").treesitter_languages,
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,

		dependencies = {
			"mrjones2014/nvim-ts-rainbow",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-ts-rainbow

	{
		"mrjones2014/nvim-ts-rainbow",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.nvim_ts_rainbow
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ rainbow_csv

	{
		"mechatroner/rainbow_csv",
		ft = { "csv", "tsv" },
		enabled = function()
			return Customize.rainbow_csv
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ sxhkd-vim

	{
		"kovetskiy/sxhkd-vim",
		event = "VeryLazy",
		enabled = function()
			return Customize.sxhkd_vim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
