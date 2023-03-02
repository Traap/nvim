Constants = require("config.constants")
Customize = require("config.customize")

return {
	-- {{{ nvim-dap

	{
		"mfussenegger/nvim-dap",
		ft = { "rb", "rs" },
		enabled = function()
			return Customize.nvim_dap
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-ui

	{
		"rcarriga/nvim-dap-ui",
		ft = { "rb", "rs" },
		keys = "<leader>dU",

		enabled = function()
			return Customize.nvim_dap_ui
		end,

		opts = {
			expand_lines = true,

			icons = Constants.icons.dap,

			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},

			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.33,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.50 },
						{ id = "console", size = 0.50 },
					},
					size = 0.25,
					position = "bottom",
				},
			},

			floating = {
				max_height = 0.9,
				max_width = 0.5,
				border = vim.g.border_chars,
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-dap-virtual-text

	{
		"theHamsta/nvim-dap-virtual-text",
		enabled = function()
			return Customize.nvim_dap_virtual_text
		end,
		opts = {
			enabled = true,
			enabled_commands = false,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
			commented = false,
			show_stop_reason = true,
			virt_text_pos = "eol",
			all_frames = false,
		},
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ rust-tools.nvim

	{
		"simrat39/rust-tools.nvim",
		enabled = function()
			return Customize.rust_tools_nvim
		end,
		ft = "rs",
		dependencies = {
			"saecki/crates.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	-- ------------------------------------------------------------------------ }}}
	-- {{{ crates.nvim

	{
		"saecki/crates.nvim",
		enabled = function()
			return Customize.crates_nvim
		end,
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
