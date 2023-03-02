Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ Comment.nvim

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("Comment.nvim"),
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ bullets.nvim

	{
		"dkarter/bullets.vim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("bullets.vim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ clipboard-image.nvim

	{
		"ekickx/clipboard-image.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("clipboard-image.nvim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ neoformat

	{
		"sbdchd/neoformat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("neoformat"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-autopairs

	{
		"windwp/nvim-autopairs",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("nvim-autopairs"),
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-spectre

	{
		"windwp/nvim-spectre",
		enabled = Is_Enabled("nvim-spectre"),
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-surround

	{
		"kylechui/nvim-surround",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		enabled = Is_Enabled("nvim-surround"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vimtex

	{
		"lervag/vimtex",
		ft = { "tex", "texx" },
		enabled = Is_Enabled("vimtex"),
		dependencies = { "Traap/vim-bundle-vimtex" },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundle-plantuml

	{
		"Traap/vim-bundle-plantuml",
		ft = "puml",
		enabled = Is_Enabled("vim-bundle-plantuml"),
		dependencies = {
			"aklt/plantuml-syntax",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-commentary

	{
		"tpope/vim-commentary",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-commentary"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-easy-align

	{
		"junegunn/vim-easy-align",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-easy-align"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-endwise

	{
		"tpope/vim-endwise",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-endwise"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-repeat

	{
		"tpope/vim-repeat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-repeat"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-surround

	{
		"tpope/vim-surround",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-surround"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-unimpaired

	{
		"tpope/vim-unimpaired",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-unimpaired"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ wiki.vim

	{
		"lervag/wiki.vim",
		cmd = { "WikiIndex", "WikiJournal" },
		ft = { "wiki", "md", "puml" },
		enabled = Is_Enabled("wiki.vim"),
		dependencies = {
			"lervag/wiki-ft.vim",
			"Traap/vim-bundle-plantuml",
			"Traap/vim-bundle-wiki.vim",
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
