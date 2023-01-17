return {
  { 'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,
    dependencies = {
      { 'xiyaowong/nvim-transparent',
        opts = function ()
          return {
            {
              enable = true,
              extra_gropus = {
                'Comment',
                'CursorLine',
                'CursorLineNr',
                'CursorLineSign',
                'Folded',
                'LineNr',
                'Normal',
                'SignColumn',
              },
              exclude = {
                'ColorColumn',
                'EndOfBuffer',
                'NonText',
              },
            }
          }
        end,
        cmd = 'TransparentEnable',
      },
      { 'norcalli/nvim-colorizer.lua', config = true},
      { 'mechatroner/rainbow_csv'},
    }
  },
}
