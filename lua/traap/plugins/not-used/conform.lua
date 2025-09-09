return {
  'stevearc/conform.nvim',
  enabled = true,
  event = require("traap.config.events").file,
  cmd = { 'ConformInfo' },

  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
}
