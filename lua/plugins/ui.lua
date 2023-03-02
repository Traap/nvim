Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ alpha-nvim

	{
		"goolord/alpha-nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("alpha-nvim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Indent guides for Neovim

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("indent-blankline"),
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
		enabled = Is_Enabled("markdown-preview.nvim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-web-devicons

	{
		"nvim-tree/nvim-web-devicons",
		enabled = Is_Enabled("nvim-web-devicons"),
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
		enabled = Is_Enabled("vim-most-minimal-folds"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ virtcolumn.nvim

	{
		"xiyaowong/virtcolumn.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("virtcolumn.nvim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Which-key

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = Is_Enabled("which-key.nvim"),
		keys = false,
	},

	-- ----------------------------------------------------------------------- }}}
}
