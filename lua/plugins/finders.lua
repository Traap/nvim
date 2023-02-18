return {
  -- {{{ JuneGunn fzf.

  {
    "junegunn/fzf",
    enabled = function()
      return require("config.customize").fzf
    end,
    event = "BufEnter",
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
    enabled = function()
      return require("config.customize").vim_projectionist
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-neo-tree

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = function()
      return require("config.customize").neo_tree_nvim
    end,
    cmd = "Neotree",
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "right",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ Telescope

  {
    "nvim-telescope/telescope.nvim",
    enabled = function()
      return require("config.customize").telescope
    end,
    cmd = "Telescope",
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
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
