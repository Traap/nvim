Customize = require("config.customize")

return {
	-- {{{ vim-tmux-navigator

	{
		"christoomey/vim-tmux-navigator",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_tmux_navigator
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-tmux-runner

	{
		"christoomey/vim-tmux-runner",
		enabled = function()
			return Customize.vim_tmux_runner
		end,

		cmd = "VtrOpenRunner",
		dependencies = {
			"Traap/vim-bundle-tmux-runner",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ harpoon

	{
		"ThePrimeagen/harpoon",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.harpoon
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
