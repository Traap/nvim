Customize = require("config.customize")

return {
	-- {{{ Disable LazyVim plugins I don't use or use LazyVim defaults.
	--     As an example, I the default LazyVim implementation for lualine.

	{ "RRethy/vim-illuminate", enabled = Customize.vim_illuminate },
	{ "SmiteshP/nvim-navic", enabled = Customize.nvim_navic },
	{ "akinsho/bufferline.nvim", enabled = Customize.bufferline_nvim },
	{ "echasnovski/mini.ai", enabled = Customize.mini_ai },
	{ "echasnovski/mini.comment", enabled = Customize.mini_comment },
	{ "echasnovski/mini.indentscope", enabled = Customize.mini_indentscope },
	{ "echasnovski/mini.pairs", enabled = Customize.mini_pairs },
	{ "echasnovski/mini.surround", enabled = Customize.mini_surround },
	{ "folke/neodev.nvim", enabled = Customize.neodev_nvim },
	{ "folke/noeconf.nvim", enabled = Customize.neoconf_nvim },
	{ "ggandor/leap.nvim", enabled = Customize.leap_nvim },
	{ "nvim-lualine/lualine.nvim", enabled = Customize.nvim_lualine },

	-- ----------------------------------------------------------------------- }}}
}
