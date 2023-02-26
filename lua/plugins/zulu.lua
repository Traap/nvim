-- Zulu should be the last file loaded by lazy.

Customize = require("config.customize")

return {
	-- {{{ vim-bundle-abbreviate

	{
		"Traap/vim-bundle-abbreviate",
		event = { "BufReadPost", "BufNewFile" },
		enabled = function()
			return Customize.vim_bundle_abbreviate
			-- return require("config.customize").vim_bundle_abbreviate
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
