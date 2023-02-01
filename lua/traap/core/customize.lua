local Customize = {}

-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

Customize = {
  alpha_nvim             = false,
  bullets_vim            = false,
  clipboard_image_nvim   = true,
  dressing               = false,
  fzf                    = true,
  gem_browse             = true,
  gitsigns_nvim          = true,
  harpoon                = true,
  indent_blankline       = true,
  neoformat              = false,
  noice_nvim             = false,
  nvim_colorizer_lua     = true,
  nvim_autopairs         = true,
  nvim_base16            = true,
  nvim_lualine           = true,
  nvim_notify            = true,
  nvim_spectre           = true,
  nvim_tree              = true,
  nvim_treesitter        = true,
  nvim_ts_rainbow        = false,
  nvim_unimpaired        = true,
  nvim_web_devicons      = true,
  plenary_nvim           = true,
  popup_nvim             = true,
  rainbow_csv            = true,
  sxhkd_nvim             = true,
  telescope              = true,
  transparent            = true,
  trouble_nvim           = true,
  vim_bbye               = true,
  vim_bundle_abbreviate  = true,
  vim_bundle_plantuml    = true,
  vim_bundler            = true,
  vim_commentary         = true,
  vim_easy_align         = true,
  vim_endwise            = true,
  vim_eunuch             = true,
  vim_fugitive           = true,
  vim_most_minimal_folds = true,
  vim_projectionist      = true,
  vim_rails              = true,
  vim_rake               = true,
  vim_rbenv              = true,
  vim_repeat             = true,
  vim_startuptime        = true,
  vim_surround           = false,
  vim_tmux_navigator     = true,
  vim_tmux_runner        = true,
  vim_unimpaired         = true,
  vim_visual_increment   = true,
  vimtex                 = true,
  which_key_nvim         = false,
  wiki_vim               = true,
}

return Customize
