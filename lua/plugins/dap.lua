Customize = require("config.customize")
Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ nvim-dap

	{
		"mfussenegger/nvim-dap",
		ft = { "c", "cpp", "go", "rb", "rs" },
		enabled = Is_Enabled("nvim-dap"),
		config = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-go

	{
		"leoluz/nvim-dap-go",
		ft = { "go" },
		enabled = Is_Enabled("nvim-dap-go"),
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = true,
		-- opts = {
		-- 	dap_configurations = {
		-- 		{
		-- 			type = "go",
		-- 			name = "Attach remote",
		-- 			mode = "remote",
		-- 			request = "attach",
		-- 		},
		-- 	},
		-- 	delve = {
		-- 		initialize_timeout_sec = 20,
		-- 		port = "${port}",
		-- 	},
		-- },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-ui

	{
		"rcarriga/nvim-dap-ui",
		ft = { "c", "cpp", "go", "rb", "rs" },
		keys = "<leader>dU",
		enabled = Is_Enabled("nvim-dap-ui"),
		config = true,
		-- opts = {
		-- 	expand_lines = true,

		-- 	icons = Constants.icons.dap,

		-- 	mappings = {
		-- 		expand = { "<CR>", "<2-LeftMouse>" },
		-- 		open = "o",
		-- 		remove = "d",
		-- 		edit = "e",
		-- 		repl = "r",
		-- 		toggle = "t",
		-- 	},

		-- 	layouts = {
		-- 		{
		-- 			elements = {
		-- 				{ id = "scopes", size = 0.33 },
		-- 				{ id = "breakpoints", size = 0.17 },
		-- 				{ id = "stacks", size = 0.25 },
		-- 				{ id = "watches", size = 0.25 },
		-- 			},
		-- 			size = 0.33,
		-- 			position = "right",
		-- 		},
		-- 		{
		-- 			elements = {
		-- 				{ id = "repl", size = 0.50 },
		-- 				{ id = "console", size = 0.50 },
		-- 			},
		-- 			size = 0.25,
		-- 			position = "bottom",
		-- 		},
		-- 	},

		-- 	floating = {
		-- 		max_height = 0.9,
		-- 		max_width = 0.5,
		-- 		border = vim.g.border_chars,
		-- 		mappings = {
		-- 			close = { "q", "<Esc>" },
		-- 		},
		-- 	},
		-- },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-virtual-text

	{
		"theHamsta/nvim-dap-virtual-text",
		enabled = Is_Enabled("nvim-dap-virtual-text"),
		config = true,
		-- opts = {
		-- 	enabled = true,
		-- 	enabled_commands = false,
		-- 	highlight_changed_variables = true,
		-- 	highlight_new_as_changed = true,
		-- 	commented = false,
		-- 	show_stop_reason = true,
		-- 	virt_text_pos = "eol",
		-- 	all_frames = false,
		-- },
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ telescope-dap.nvim

	{
		"nvim-telescope/telescope-dap.nvim",
		enabled = Is_Enabled("telescope-dap.nvim"),
		ft = { "c", "cpp", "go", "rb", "rs" },
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = true,
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ crates.nvim

	{
		"saecki/crates.nvim",
		enabled = Is_Enabled("crates.nvim"),
		ft = "rs",
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
}
