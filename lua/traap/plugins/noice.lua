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
    -- {{{ Commands

    opts.commands = {
      all = {
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ LSP

    opts.lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Messages

    opts.messages  = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext",
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Notify

    opts.notify = {
      enabled = true,
      view = "notify"
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Popupmenu

    opts.popupmenu = {
      enabled = true,
      backend = "nui",
      -- kind_icons = {},
    }
    -- --------------------------------------------------------------------- }}}
    -- {{{ Presets

    opts.presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = false,
      inc_rename = true,
      lsp_doc_border = true,
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Redirect

    opts.redirect  = {
      view = "mini",
      filter = { event = "msg_show" },
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Routes

    opts.routes = {
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
            { find = "E490: No fold found" },
            { find = "E486: Pattern not found" },
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

      {
        filter = {
          event = "notify",
          kind = "No fold found",
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "notify",
          kind = "No information available",
        },
        opts = { skip = true },
      },

    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Views

    opts.views = {
      mini = {
        win_options = {
          winblend = 0,
        },
        border = {
          style = "none",
          padding = {0, 1},
        }
      },
    }

    -- --------------------------------------------------------------------- }}}
  end,
}
