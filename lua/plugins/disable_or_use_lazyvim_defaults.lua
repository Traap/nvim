require("config.globals")

-- {{{ Disable or Use documentation.
--
-- Disable LazyVim plugins I don't use or use LazyVim defaults. As an
-- example, I use the default LazyVim implementation for null-ls.nvim.
--
-- ----------------------------------------------------------------------- }}}

return {
  { "catppuccin/nvim", enabled = Is_Enabled("catppuccin"), },
  { "goolord/alpha-nvim", enabled = Is_Enabled("alpha-nvim") },
  { "jay-babu/mason-nvim-dap.nvim", enabled = Is_Enabled("mason-nvim-dap.nvim") },
  { "jose-elias-alvarez/null-ls.nvim", enabled = Is_Enabled("null-ls.nvim") },
  { "mfussenegger/nvim-dap", enabled = Is_Enabled("nvim-dap") },
  { "stevearc/dressing.nvim", enabled = Is_Enabled("dressing") },
}
