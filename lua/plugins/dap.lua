Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ nvim-dap

	{
		"mfussenegger/nvim-dap",
		enabled = Is_Enabled("nvim-dap"),
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-ui

	{
		"rcarriga/nvim-dap-ui",
		enabled = Is_Enabled("nvim-dap-ui"),
		event = "VeryLazy",
		keys = "<leader>dU",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-virtual-text

	{
		"theHamsta/nvim-dap-virtual-text",
		enabled = Is_Enabled("nvim-dap-virtual-text"),
		event = "VeryLazy",
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ telescope-dap.nvim

	{
		"nvim-telescope/telescope-dap.nvim",
		enabled = Is_Enabled("telescope-dap.nvim"),
		event = "VeryLazy",
	},

	-- ------------------------------------------------------------------------ }}}

	-- Languages

	-- {{{ crates.nvim

	{
		"saecki/crates.nvim",
		enabled = Is_Enabled("crates.nvim"),
		dependencies = { "mfussenegger/nvim-dap" },
		ft = { "rs" },
		opts = {
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
			popup = {
				border = "rounded",
			},
		},
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ nvim-dap-go

	{
		"leoluz/nvim-dap-go",
		enabled = Is_Enabled("nvim-dap-go"),
		dependencies = { "mfussenegger/nvim-dap" },
		ft = { "go" },
		opts = {
			dap_configurations = {
				{
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
			delve = {
				initialize_timeout_sec = 20,
				port = "${port}",
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
