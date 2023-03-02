Constants = require("config.constants")
Customize = require("config.customize")

return {
	-- {{{ alpha-nvim

	{
		"goolord/alpha-nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.alpha_nvim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Indent guides for Neovim

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.indent_blankline
		end,
		opts = {
			char = "│",
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
			},
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ markdown-perview.nvim

	{
		"iamcco/markdown-preview.nvim",
		ft = "md",
		enabled = function()
			return Customize.markdown_preview_nvim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-web-devicons

	{
		"nvim-tree/nvim-web-devicons",
		enabled = function()
			return Customize.nvim_web_devicons
		end,

		cmd = {
			"NvimTreeFindFile",
			"NvimTreeRefresh",
			"NvimTreeToggle",
		},

		opts = {
			override = Constants.icons.web_devicons,
		},
	},

	-------------------------------------------------------------------------- }}}
	-- {{{ vim-most-minimal-folds

	{
		"vim-utils/vim-most-minimal-folds",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_most_minimal_folds
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ virtcolumn.nvim

	{
		"xiyaowong/virtcolumn.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.virtcolumn_nvim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Which-key

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = function()
			return Customize.which_key_nvim
		end,
		keys = false,
	},

	-- ----------------------------------------------------------------------- }}}
}
