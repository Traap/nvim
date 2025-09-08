-- Control control event for plugins I use with defaults. Yep! This means I
-- may be disabling plugins LazyVim uses by default.  And, I explicitly
-- manage the dependencies when needed.
local EVENT = require("traap.config.events").file

return {
  {enabled = false, event = EVENT, "akinsho/bufferline.nvim" },
  {enabled = false, event = EVENT, "RRethy/vim-illuminate" },
  {enabled = false, event = EVENT, "saghen/blink.cmp" },
  {enabled = true,  event = EVENT, "echasnovski/mini.ai" },
  {enabled = true,  event = EVENT, "echasnovski/mini.comment" },
  {enabled = false, event = EVENT, "echasnovski/mini.indentscope" },
  {enabled = true,  event = EVENT, "echasnovski/mini.pairs" },
  {enabled = true,  event = EVENT, "echasnovski/mini.surround" },
  {enabled = false, event = EVENT, "rcarriga/nvim-notify" },
  {enabled = false, event = EVENT, "folke/flash.nvim" },
  {enabled = true,  event = EVENT, "folke/trouble.nvim" },
  {enabled = false, event = EVENT, "nvim-treesitter/nvim-treesitter-context" },
  {enabled = true,  event = EVENT, "nvim-treesitter/nvim-treesitter-textobjects" },
}

