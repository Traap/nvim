return {
  { 'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])
    end,

    dependencies = {
      { 'xiyaowong/nvim-transparent',

        event = 'VimEnter',

        config = function()
          vim.cmd([[TransparentEnable]])
        end,

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
      },
    }
  },
}
