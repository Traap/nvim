Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ gem-browse

	{
		"tpope/gem-browse",
		ft = { "rb" },
		enabled = Is_Enabled("gem-browse"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-neo-tree

	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = Is_Enabled("neo-tree.nvim"),
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
		enabled = Is_Enabled("nvim-tree"),

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
