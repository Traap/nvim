local Customize = {}

-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

Customize = {
  alpha             = false,
  dressing          = false,
  indent_blankline  = true,
  noice             = false,
  nvim_tree         = true,
  nvim_web_devicons = false,
  plantuml          = true,
  telescope         = true,
  transparent       = true,
  treesitter        = true,
  vim_tmux_runner   = true,
  which_key         = false,
  wiki_vim          = true,
}

return Customize
