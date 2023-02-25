return {
	-- {{{ Comment.nvim

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		enabled = function()
			return require("config.customize").commentary_nvim
		end,
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
		lazy = false,
		enabled = function()
			return require("config.customize").bullets_vim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ clipboard-image.nvim

	{
		"ekickx/clipboard-image.nvim",
		event = "InsertEnter",
		enabled = function()
			return require("config.customize").clipboard_image_nvim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ neoformat

	{
		"sbdchd/neoformat",
		event = "VeryLazy",
		enabled = function()
			return require("config.customize").neoformat
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-autopairs

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		enabled = function()
			return require("config.customize").nvim_autopairs
		end,
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-spectre

	{
		"windwp/nvim-spectre",
		enabled = function()
			return require("config.customize").nvim_spectre
		end,
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
		event = "InsertEnter",
		config = true,
		enabled = function()
			return require("config.customize").nvim_surround
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vimtex

	{
		"lervag/vimtex",
		ft = { "tex", "texx" },
		enabled = function()
			return require("config.customize").vimtex
		end,
		dependencies = { "Traap/vim-bundle-vimtex" },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundle-plantuml

	{
		"Traap/vim-bundle-plantuml",
		ft = "puml",
		enabled = function()
			return require("config.customize").vim_bundle_plantuml
		end,
		dependencies = {
			"aklt/plantuml-syntax",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-commentary

	{
		"tpope/vim-commentary",
		event = "VeryLazy",
		enabled = function()
			return require("config.customize").vim_commentary
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-easy-align

	{
		"junegunn/vim-easy-align",
		enabled = function()
			return require("config.customize").vim_easy_align
		end,
		event = "BufEnter",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-endwise

	{
		"tpope/vim-endwise",
		event = "InsertEnter",
		enabled = function()
			return require("config.customize").vim_endwise
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-repeat

	{
		"tpope/vim-repeat",
		event = "InsertEnter",
		enabled = function()
			return require("config.customize").vim_bundler
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-surround

	{
		"tpope/vim-surround",
		event = "InsertEnter",
		enabled = function()
			return require("config.customize").vim_surround
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-unimpaired

	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
		enabled = function()
			return require("config.customize").vim_unimpaired
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ wiki.vim

	{
		"lervag/wiki.vim",
		cmd = { "WikiIndex", "WikiJournal" },
		ft = { "wiki", "md", "puml" },
		enabled = function()
			return require("config.customize").wiki_vim
		end,
		dependencies = {
			"lervag/wiki-ft.vim",
			"Traap/vim-bundle-wiki.vim",
			"Traap/vim-bundle-plantuml",
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
