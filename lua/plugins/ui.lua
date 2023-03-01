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
			override = {
				Dockerfile = { icon = "", color = "#b8b5ff", name = "Dockerfile" },
				css = { icon = "", color = "#61afef", name = "css" },
				deb = { icon = "", color = "#a3b8ef", name = "deb" },
				html = { icon = "", color = "#DE8C92", name = "html" },
				jpeg = { icon = " ", color = "#BD77DC", name = "jpeg" },
				jpg = { icon = " ", color = "#BD77DC", name = "jpg" },
				js = { icon = "", color = "#EBCB8B", name = "js" },
				kt = { icon = "󱈙", color = "#ffcb91", name = "kt" },
				lock = { icon = "", color = "#DE6B74", name = "lock" },
				md = { icon = "", color = "#b8b5ff", name = "mp3" },
				mp3 = { icon = "", color = "#C8CCD4", name = "mp3" },
				mp4 = { icon = "", color = "#C8CCD4", name = "mp4" },
				out = { icon = "", color = "#C8CCD4", name = "out" },
				png = { icon = " ", color = "#BD77DC", name = "png" },
				py = { icon = "", color = "#a7c5eb", name = "py" },
				rb = { icon = "", color = "#ff75a0", name = "rb" },
				rpm = { icon = "", color = "#fca2aa", name = "rpm" },
				toml = { icon = "", color = "#61afef", name = "toml" },
				ts = { icon = "ﯤ", color = "#519ABA", name = "ts" },
				vue = { icon = "﵂", color = "#7eca9c", name = "vue" },
				xz = { icon = "", color = "#EBCB8B", name = "xz" },
				yaml = { icon = "", color = "#EBCB8B", name = "xz" },
				zip = { icon = "", color = "#EBCB8B", name = "zip" },
			},
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
