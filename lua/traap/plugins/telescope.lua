-- Telescope custimization.
return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    opts = {
      defaults = {
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
    },
  },

  -- Telescope fzf native
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('fzf')
    end,
  },
}
