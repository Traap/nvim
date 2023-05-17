Is_Enabled = require("config.functions").is_enabled

local bullets = "bullets.vim"
local clipboard = "clipboard-image.nvim"

return {
	-- {{{ bullets.nvim

	{
		"dkarter/" .. bullets,
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled(bullets),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ clipboard-image.nvim

	{
		"ekickx/" .. clipboard,
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled(clipboard),
	},

	-- ----------------------------------------------------------------------- }}}
}
