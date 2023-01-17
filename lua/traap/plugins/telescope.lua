-- Telescope custimization.
return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'BufEnter',
    opts = function ()
      return {
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = { prompt_position = 'top' },
          winblend = 0,
          sorting_strategy = 'ascending',
        },
      }
    end,

    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-media-files.nvim' },
    },

--    config = function(_, opts)
--      local telescope = require('telescope')
--      telescope.setup(opts)
--      telescope.load_extension('fzf')
--      telescope.load_extension({'pdf', 'png', 'jpg', 'jpeg'})
--    end,
  },
}
