---@type boolean
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ Disable LazyVim plugins I don't use or use LazyVim defaults. As an
  -- example, I use the default LazyVim implementation for null-ls.nvim.

  { "MunifTanjim/nui.nvim", enabled = Is_Enabled("nui.nvim") },
  { "RRethy/vim-illuminate", enabled = Is_Enabled("vim-illuminate") },
  { "SmiteshP/nvim-navic", enabled = Is_Enabled("nvim-navic") },
  { "akinsho/bufferline.nvim", enabled = Is_Enabled("bufferline.nvim") },
  { "catppuccin/nvim", enabled = Is_Enabled("catppuccin"), },
  { "echasnovski/mini.ai", enabled = Is_Enabled("mini-ai") },
  { "echasnovski/mini.comment", enabled = Is_Enabled("mini-comment") },
  { "echasnovski/mini.indentscope", enabled = Is_Enabled("mini-indentscope") },
  { "echasnovski/mini.pairs", enabled = Is_Enabled("mini-pairs") },
  { "echasnovski/mini.surround", enabled = Is_Enabled("mini-surround") },
  { "folke/neoconf.nvim", enabled = Is_Enabled("neoconf.nvim") },
  { "folke/neodev.nvim", enabled = Is_Enabled("neodev.nvim") },
  { "folke/trouble.nvim", enabled = Is_Enabled("trouble.nvim"), },
  { "ggandor/flit.nvim", enabled = Is_Enabled("flit.nvim") },
  { "ggandor/leap.nvim", enabled = Is_Enabled("leap.nvim") },
  { "goolord/alpha-nvim", enabled = Is_Enabled("alpha-nvim") },
  { "jay-babu/mason-nvim-dap.nvim", enabled = Is_Enabled("mason-nvim-dap.nvim") },
  { "jose-elias-alvarez/null-ls.nvim", enabled = Is_Enabled("null-ls.nvim") },
  { "mfussenegger/nvim-dap", enabled = Is_Enabled("nvim-dap") },
  { "stevearc/dressing.nvim", enabled = Is_Enabled("dressing") },

  -- ----------------------------------------------------------------------- }}}
}
