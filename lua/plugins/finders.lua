Customize = require("config.customize")

return {
	-- {{{ JuneGunn fzf.

	{
		"junegunn/fzf",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.fzf
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
			return Customize.vim_projectionist
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Telescope

	{
		"nvim-telescope/telescope.nvim",
		enabled = function()
			return Customize.telescope
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
	-- {{{ todo-comments.nvim
	--
	--     Youtube: I use this marker when I make videos.
	--     URL: https://fontawesome.com/v3/icon/youtube
	--
	--
	--     Unicodes:
	--       Youtube -> F167
	--       Cloud -> F0C2

	{
		"folke/todo-comments.nvim",
		endabled = function()
			return Customize.todo_comments_nvim
		end,

		opts = function(_, opts)
			opts.merge_keywords = true
			opts.keywords = {
				Youtube = { icon = " ", color = "#ff0000" },
				URL = { icon = " ", color = "#7711FF", alt = { "Url", "url" } },
			}
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
