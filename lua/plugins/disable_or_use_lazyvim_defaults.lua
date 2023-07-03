require("config.globals")

-- {{{ Disable or Use documentation.
--
-- Disable LazyVim plugins I don't use or use LazyVim defaults. As an
-- example, I use the default LazyVim implementation for null-ls.nvim.
--
-- ----------------------------------------------------------------------- }}}

return {
  { "catppuccin/nvim", enabled = Is_Enabled("catppuccin"), },
  { "stevearc/dressing.nvim", enabled = Is_Enabled("dressing") },
}
