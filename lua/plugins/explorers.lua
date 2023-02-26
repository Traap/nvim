return {
	-- {{{ gem-browse

	{
		"tpope/gem-browse",
		ft = { "rb" },
		enabled = function()
			return require("config.customize").gem_browse
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-neo-tree

	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = function()
			return require("config.customize").neo_tree_nvim
		end,
		cmd = "Neotree",
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		-- keys = function() return {} end,
		keys = false,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
			},
			window = {
				position = "right",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-------------------------------------------------------------------------- }}}
	-- {{{ nvim-tree

	{
		"kyazdani42/nvim-tree.lua",
		enabled = function()
			return require("config.customize").nvim_tree
		end,

		cmd = {
			"NvimTreeFindFile",
			"NvimTreeRefresh",
			"NvimTreeToggle",
		},

		opts = {
			filters = {
				custom = { ".git" },
			},
			view = {
				side = "right",
				width = 30,
			},
		},
	},

	-------------------------------------------------------------------------- }}}
}
