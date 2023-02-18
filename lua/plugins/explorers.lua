return {
  -- {{{ gem-browse

  {
    "tpope/gem-browse",
    ft = { "rb" },
    enabled = function()
      return require("config.customize").gem_browse
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-tree

  {
    "kyazdani42/nvim-tree.lua",
    enabled = function()
      return require("config.customize").nvim_tree
    end,

    cmd = {
      "NvimTreeFindFile",
      "NvimTreeRefresh",
      "NvimTreeToggle",
    },

    opts = {
      filters = {
        custom = { ".git" },
      },
      view = {
        side = "right",
        width = 30,
      },
    },
  },

  -------------------------------------------------------------------------- }}}
}
