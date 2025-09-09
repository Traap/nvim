return   {
  'MagicDuck/grug-far.nvim',
  event = require("traap.config.events").file,
  enabled = true,
  config = function()
    require('grug-far').setup({})
  end
}
