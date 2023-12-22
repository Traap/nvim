return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},
  config = function()
     require('lspconfig.ui.windows').default_options.border = 'single'
  end
}
