local filetypes = { "markdown", "wiki" }

return {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  ft = filetypes,
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = filetypes
  end,
}
