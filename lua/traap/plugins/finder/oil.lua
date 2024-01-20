return {
  "stevearc/oil.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  cmd = "Oil",
  keys = { { "<leader>no", "<cmd>Oil --float<cr>", desc = "Oil buffer" } },
  enabled = true,

  -- {{{ Option
  opts = function(_, opts)

    opts.columns = {"icon"}
    opts.prompt_save_on_select_new_entry = true
    opts.use_default_keymaps =  false

    opts.keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["q"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["g."] = "actions.toggle_hidden",
    }

    opts.float = {
      border = "rounded",
      max_height = 25,
      max_width = 50,
      padding = 0,
      win_options = { winblend = 0, },
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configuration

  config = function(_, opts)
    require("oil").setup(opts)
  end,

  -- ----------------------------------------------------------------------- }}}
}
