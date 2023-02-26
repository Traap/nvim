Customize = require("config.customize")

return {
	-- {{{ Comment.nvim

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.commentary_nvim
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
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.bullets_vim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ clipboard-image.nvim

	{
		"ekickx/clipboard-image.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.clipboard_image_nvim
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ neoformat

	{
		"sbdchd/neoformat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.neoformat
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-autopairs

	{
		"windwp/nvim-autopairs",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.nvim_autopairs
		end,
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-spectre

	{
		"windwp/nvim-spectre",
		enabled = function()
			return Customize.nvim_spectre
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
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		enabled = function()
			return Customize.nvim_surround
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vimtex

	{
		"lervag/vimtex",
		ft = { "tex", "texx" },
		enabled = function()
			return Customize.vimtex
		end,
		dependencies = { "Traap/vim-bundle-vimtex" },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundle-plantuml

	{
		"Traap/vim-bundle-plantuml",
		ft = "puml",
		enabled = function()
			return Customize.vim_bundle_plantuml
		end,
		dependencies = {
			"aklt/plantuml-syntax",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-commentary

	{
		"tpope/vim-commentary",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_commentary
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-easy-align

	{
		"junegunn/vim-easy-align",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_easy_align
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-endwise

	{
		"tpope/vim-endwise",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_endwise
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-repeat

	{
		"tpope/vim-repeat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_repeat
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-surround

	{
		"tpope/vim-surround",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_surround
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-unimpaired

	{
		"tpope/vim-unimpaired",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_unimpaired
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ wiki.vim

	{
		"lervag/wiki.vim",
		cmd = { "WikiIndex", "WikiJournal" },
		ft = { "wiki", "md", "puml" },
		enabled = function()
			return Customize.wiki_vim
		end,
		dependencies = {
			"lervag/wiki-ft.vim",
			"Traap/vim-bundle-wiki.vim",
			"Traap/vim-bundle-plantuml",
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
