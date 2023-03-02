-- Zulu should be the last file loaded by lazy.
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ vim-bundle-abbreviate

	{
		"Traap/vim-bundle-abbreviate",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-bundle-abbreviate"),
	},

	-- ----------------------------------------------------------------------- }}}
}
