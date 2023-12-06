return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,

  keys = {
    {"<leader>ne", "<cmd>NoiceErrors<cr>"},
    {"<leader>nh", "<cmd>NoiceHistory<cr>"}
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = function(_, opts)
    -- {{{ lsp

    opts.lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    }


    -- --------------------------------------------------------------------- }}}
    -- {{{ messages

    opts.messagres = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext",
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ presets

    opts.presets = { bottom_search = false, }

    -- --------------------------------------------------------------------- }}}
    -- {{{ views

    opts.views = {
      mini = { win_options = { winblend = 0, }, },
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ routes

    opts.routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          kind = "echo",
          any = {
            { find = "Prompt" },
            { find = "No lines in buffer" },
            { find = "line" },
            { find = "lines" },
          },
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          kind = "emsg",
          any = {
            { find = "No fold found" },
            { find = "Pattern not found" },
          },
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          kind = "wmsg",
        },
        opts = { skip = true },
      },

    }
    -- --------------------------------------------------------------------- }}}
  end,
}
