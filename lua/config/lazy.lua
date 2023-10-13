--  Traap's personal Lazy setup.

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.coding.yanky"},
    { import = "lazyvim.plugins.extras.dap.core"},
    { import = "lazyvim.plugins.extras.lang.clangd"},
    { import = "lazyvim.plugins.extras.lang.go"},
    { import = "lazyvim.plugins.extras.lang.json"},
    { import = "lazyvim.plugins.extras.lang.python"},
    { import = "lazyvim.plugins.extras.lang.ruby"},
    { import = "lazyvim.plugins.extras.lang.rust"},
    { import = "lazyvim.plugins.extras.lang.tailwind"},
    { import = "lazyvim.plugins.extras.lang.typescript"},
    { import = "lazyvim.plugins.extras.lsp.none-ls"},
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
