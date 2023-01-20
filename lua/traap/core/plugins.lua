-- {{{ Lazy setup

require("lazy").setup({
	spec = {
		-- { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
		{ import = "traap.plugins" },
	},

	defaults = {
		lazy = true,
		version = "*",
	},

	install = { colorscheme = { 'tokyonight', 'habamax' } },

	checker = { enable = true },

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- ------------------------------------------------------------------------- }}}
