Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

return {
  -- {{{ gem-browse

  {
    "tpope/gem-browse",
    event = { "BufEnter *.rb", "BufEnter *.gemspec", "BufEnter Gemfile" },
    enabled = Is_Enabled("gem-browse"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-neo-tree

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = Is_Enabled("neo-tree.nvim"),
    keys = false,
    opts = function(_, opts)
        -- Use LazyVim default setup.
      if Use_Defaults("neo-tree.nvim") then
        opts = opts
      else
        opts.filesystem = { bind_to_cwd = false, follow_current_file = true, }
        opts.window = { position = "right", }
      end
    end,
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ nvim-tree

  {
    "kyazdani42/nvim-tree.lua",
    enabled = Is_Enabled("nvim-tree"),

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
  -- {{{ nvim-web-devicons

  {
    "nvim-tree/nvim-web-devicons",
    enabled = Is_Enabled("nvim-web-devicons")
      and (Is_Enabled("nvim-tree") or Is_Enabled("lualine.nvim")),
    opts = {
      override = Constants.icons.web_devicons,
    },
  },

  -------------------------------------------------------------------------- }}}
}
