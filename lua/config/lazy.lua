--  Traap's personal Lazy setup.

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	defaults = {
		lazy = true,
		version = false,
	},

	install = { colorscheme = { "tokyonight", "habamax" } },

	checker = { enabled = true },

	performance = {
    cache = { enabled = true, },
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
