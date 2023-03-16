Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ JuneGunn fzf.

  {
    "junegunn/fzf.vim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("fzf.vim"),
    dependencies = {
      "junegunn/fzf.vim",
      "Traap/vim-bundle-fzf",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-projectionist

  {
    "tpope/vim-projectionist",
    ft = { "c", "cpp", "rb" },
    enabled = Is_Enabled("vim-projectionist"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope

  {
    "nvim-telescope/telescope.nvim",
    enabled = Is_Enabled("telescope.nvim"),
    cmd = "Telescope",
    keys = false,
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        colorscheme = { enable_preview = true },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Telescope fzf native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = Is_Enabled("telescope-fzf-native.nvim"),
    cmd = "Telescope",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ todo-comments.nvim
  --
  --     Unicodes:
  --       Youtube -> F167
  --       Cloud -> F0C2

  {
    "folke/todo-comments.nvim",
    enabled = Is_Enabled("todo-comments.nvim"),
    opts = function(_, opts)
      opts.merge_keywords = true
      opts.keywords = Constants.icons.keywords
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
