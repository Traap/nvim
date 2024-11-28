return   {
  'MagicDuck/grug-far.nvim',
  event = "VeryLazy",
  enabled = true,
  config = function()
    require('grug-far').setup({})
  end
}
