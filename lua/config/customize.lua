local Customize = {}

-- {{{ Customize documentation.

-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

-- ------------------------------------------------------------------------- }}}
-- {{{ Enable or disable plugins.

Customize = {
	alpha_nvim = false,
	bufferline_nvim = false,
	bullets_vim = true,
	catppuccin = true,
	clipboard_image_nvim = true,
	commentary_nvim = false,
	dressing = false,
	flit_nvim = false,
	fzf = true,
	gem_browse = true,
	gitsigns_nvim = true,
	harpoon = true,
	indent_blankline = true,
	leap_nvim = false,
	mini_ai = false,
	mini_comment = false,
	mini_indentscope = false,
	mini_pairs = false,
	mini_surround = false,
	neo_tree_nvim = true,
	neoconf_nvim = false,
	neodev_nvim = false,
	neoformat = false,
	noice_nvim = true,
	nvim_autopairs = true,
	nvim_base16 = false,
	nvim_colorizer_lua = true,
	nvim_dap = true,
	nvim_dap_ui = true,
	nvim_dap_virtual_text = true,
	nvim_lualine = true,
	nvim_navic = false,
	nvim_notify = true,
	nvim_spectre = true,
	nvim_transparent = false,
	nvim_tree = false,
	nvim_treesitter = true,
	nvim_ts_rainbow = true,
	nvim_unimpaired = true,
	nvim_web_devicons = true,
	plenary_nvim = true,
	popup_nvim = false,
	rainbow_csv = true,
	sxhkd_nvim = true,
	telescope = true,
	todo_comments_nvim = true,
	toggleterm_nvim = true,
	tokyonight_nvim = true,
	trouble_nvim = true,
	vim_bbye = true,
	vim_bundle_abbreviate = true,
	vim_bundle_plantuml = true,
	vim_bundler = true,
	vim_commentary = true,
	vim_easy_align = true,
	vim_endwise = true,
	vim_eunuch = true,
	vim_fugitive = true,
	vim_illuminate = false,
	vim_most_minimal_folds = true,
	vim_projectionist = true,
	vim_rails = true,
	vim_rake = true,
	vim_rbenv = true,
	vim_repeat = false,
	vim_startuptime = true,
	vim_surround = false,
	vim_tmux_navigator = true,
	vim_tmux_runner = true,
	vim_unimpaired = true,
	vim_visual_increment = true,
	vimtex = true,
	which_key_nvim = false,
	wiki_vim = true,
	zen_mode_nvim = true,
	crates_nvim = true,
	rust_tools_nvim = true,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Toggle terminals

Customize.toggleterm = {

	float = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ direction = "float" })
		return t:toggle()
	end,

	lazygit = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "lazygit", direction = "float" })
		return t:toggle()
	end,

	neomutt = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "neomutt", direction = "float" })
		return t:toggle()
	end,

	ranger = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local t = Terminal:new({ cmd = "ranger", direction = "float" })
		return t:toggle()
	end,
}

-- ------------------------------------------------------------------------- }}}

return Customize
