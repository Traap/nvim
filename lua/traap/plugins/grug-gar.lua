return   {
  'MagicDuck/grug-far.nvim',
  event = require("traap.core.events").file,
  enabled = true,
  config = function()
    require('grug-far').setup({})
  end
}
