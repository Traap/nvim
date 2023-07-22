-- {{{ My personal Lazy setup.

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.dap.core"},
    { import = "lazyvim.plugins.extras.lang.clangd"},
    { import = "lazyvim.plugins.extras.lang.go"},
    { import = "lazyvim.plugins.extras.lang.json"},
    { import = "lazyvim.plugins.extras.lang.python"},
    { import = "lazyvim.plugins.extras.lang.ruby"},
    { import = "lazyvim.plugins.extras.lang.rust"},
    { import = "lazyvim.plugins.extras.lang.tailwind"},
    { import = "lazyvim.plugins.extras.lang.typescript"},
		{ import = "plugins" },
	},

	defaults = {
		lazy = true,
		version = false,
	},

	install = { colorscheme = { "tokyonight", "habamax" } },

	checker = { enabled = true },

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
