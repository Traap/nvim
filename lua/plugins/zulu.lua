-- Zulu should be the last file loaded by lazy.

return {
  -- {{{ vim-bundle-abbreviate

  {
    "Traap/vim-bundle-abbreviate",
    event = "BufEnter",
    enabled = function()
      return require("config.customize").vim_bundle_abbreviate
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
