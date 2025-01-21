return {
  "alexghergh/nvim-tmux-navigation",
  enabled = true,
  event = 'VeryLazy',

  opts = function(_, opts)
    opts.disable_when_zoomed = true
    opts.keybindings = {
      left = '<c-h>',
      down = '<c-j>',
      up = '<c-k>',
      right = '<c-l>',
      last_active = '<c-\\>',
      next='<c-]>',
    }
  end,

  config = function(_, opts)
    require("nvim-tmux-navigation").setup(opts)
  end,
}
