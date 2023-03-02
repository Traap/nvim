Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ nvim-base16

	{
		"RRethy/nvim-base16",
		enabled = Is_Enabled("nvim-base16"),
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
		enabled = Is_Enabled("tokyonight.nvim"),
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
		enabled = Is_Enabled("catppuccin"),
		lazy = true,
		name = "catppuccin",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-colorizer

	{
		"NvChad/nvim-colorizer.lua",
		enabled = Is_Enabled("nvim-colorizer.lua"),
		event = "VeryLazy",
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-transpartent

	{
		"xiyaowong/nvim-transparent",
		enabled = Is_Enabled("nvim-transparent"),
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
		enabled = Is_Enabled("nvim-treesitter"),
		version = false,
		build = ":TSUpdate",

		opts = {
			autopairs = { enable = true },
			autotag = { enable = true, disable = { "xml" } },
			context_commenting = { enable = true, enable_autocmd = false },
			highlight = {
				enable = true,
				disable = Constants.disabled.treesitter,
				additional_vim_regex_highlighting = true,
			},
			indent = { enable = true, disable = { "yml", "yaml" } },
			playground = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 1500,
				colors = Constants.colors.rainbow,
			},
			disable = { "latex" },
			ensure_installed = Constants.ensure_installed.treesitter,
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
		enabled = Is_Enabled("nvim-ts-rainbow"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ rainbow_csv

	{
		"mechatroner/rainbow_csv",
		ft = { "csv", "tsv" },
		enabled = Is_Enabled("rainbow_csv"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ sxhkd-vim

	{
		"kovetskiy/sxhkd-vim",
		event = "VeryLazy",
		enabled = Is_Enabled("sxhkd-vim"),
	},

	-- ----------------------------------------------------------------------- }}}
}
