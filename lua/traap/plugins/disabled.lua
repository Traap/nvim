if not pcall(require, 'lazyvim') then
  return {}
else
  -- Yep.  I disable plugins I don't want from LazyVim
  return {
    {"RRethy/vim-illuminate", enabled = false},
    {"akinsho/bufferline.nvim", enabled = false},
    {"echasnovski/mini.ai", enabled = false},
    {"echasnovski/mini.comment", enabled = false},
    {"echasnovski/mini.indentscope", enabled = false},
    {"echasnovski/mini.pairs", enabled = false},
    {"echasnovski/mini.surround", enabled = false},
    {"nvim-treesitter/nvim-treesitter-context", enabled = false},
    {"rcarriga/nvim-notify", enabled = false },
  }
end
