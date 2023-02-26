return {
	-- {{{ JuneGunn fzf.

	{
		"junegunn/fzf",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return require("config.customize").fzf
		end,
		dependencies = {
			"junegunn/fzf.vim",
			"Traap/vim-bundle-fzf",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-projectionist

	{
		"tpope/vim-projectionist",
		ft = { "c", "cpp", "rb" },
		enabled = function()
			return require("config.customize").vim_projectionist
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Telescope

	{
		"nvim-telescope/telescope.nvim",
		enabled = function()
			return require("config.customize").telescope
		end,
		cmd = "Telescope",
		keys = false,
		opts = {
			defaults = {
				layout_config = { prompt_position = "top" },
				layout_strategy = "horizontal",
				prompt_prefix = " ",
				selection_caret = " ",
				sorting_strategy = "ascending",
				winblend = 0,
			},
			pickers = {
				colorscheme = { enable_preview = true },
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Telescope fzf native
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
