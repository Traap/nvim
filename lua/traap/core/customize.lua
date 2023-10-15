local Customize = {}

-- {{{ Use notes.

-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - custom or advanced settings are done.
--  false - use default settings.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

-- ------------------------------------------------------------------------- }}}

Customize = {
  colorscheme = {
    base16 = true,
    folke = true,
  },
  nvim_tree = true,
  telescope = true,
  transparent = true,
  treesitter = true,
  which_key = true,
}

return Customize