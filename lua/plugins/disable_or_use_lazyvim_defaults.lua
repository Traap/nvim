require("config.globals")

-- {{{ Disable or Use documentation.
--
-- Disable LazyVim plugins I don't use or use LazyVim defaults. As an
-- example, I use the default LazyVim implementation for null-ls.nvim.
--
-- ----------------------------------------------------------------------- }}}

return {
  { "catppuccin/nvim", enabled = Is_Enabled("catppuccin"), },
  { "folke/neoconf.nvim", enabled = Is_Enabled("neoconf.nvim") },
  { "folke/neodev.nvim", enabled = Is_Enabled("neodev.nvim") },
  { "ggandor/flit.nvim", enabled = Is_Enabled("flit.nvim") },
  { "ggandor/leap.nvim", enabled = Is_Enabled("leap.nvim") },
  { "goolord/alpha-nvim", enabled = Is_Enabled("alpha-nvim") },
  { "jay-babu/mason-nvim-dap.nvim", enabled = Is_Enabled("mason-nvim-dap.nvim") },
  { "jose-elias-alvarez/null-ls.nvim", enabled = Is_Enabled("null-ls.nvim") },
  { "mfussenegger/nvim-dap", enabled = Is_Enabled("nvim-dap") },
  { "stevearc/dressing.nvim", enabled = Is_Enabled("dressing") },
}
