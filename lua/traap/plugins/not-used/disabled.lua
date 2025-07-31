if not pcall(require, 'lazyvim') then
  return {}
else
  -- Yep.  I disable plugins I don't want from LazyVim
  return {
    {"RRethy/vim-illuminate", enabled = false},
    {"akinsho/bufferline.nvim", enabled = false},
    {"echasnovski/mini.ai", enabled = true},
    {"echasnovski/mini.comment", enabled = true},
    {"echasnovski/mini.indentscope", enabled = true},
    {"echasnovski/mini.pairs", enabled = true},
    {"echasnovski/mini.surround", enabled = true},
    {"nvim-treesitter/nvim-treesitter-context", enabled = true},
    {"rcarriga/nvim-notify", enabled = false},
  }
end
