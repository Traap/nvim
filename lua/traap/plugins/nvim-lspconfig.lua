return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = "VeryLazy",
  config = function()
     require('lspconfig.ui.windows').default_options.border = 'single'
  end
}
