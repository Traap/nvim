return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,

  keys = {
    {"<leader>ne", "<cmd>NoiceErrors<cr>"},
    {"<leader>nh", "<cmd>NoiceHistory<cr>"}
  },

  opts = function(_, opts)
    -- {{{ Cmdline
    opts.cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {
        cmdline_popup = {
          win_options = {
            winblend = 0,
          },
          scrollbar = false,
        },
      },
      format = {
        cmdline = { pattern = "^:", icon = "$", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {},
      },
    }

    -- --------------------------------------------------------------------- }}}
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
      progress = {
        enable = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30,
        view = "mini",
      },

      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },

      hover = {
        enable = true,
      },

      signature = {
        enable = true,
      },

      message = {
        enabled = true,
        view = "mini",
        opts = {},
      },

      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Health

    opts.health = {
      checker = true,
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Markdown

    opts.markdown = {
      hover = {
        ["|(%S-)|"] = vim.cmd.help,
        ["%[.-%]%((%S-)%)"] = require("noice.util").open,
      },

      highlights = {
        ["|%S-|"] = "@text.reference",
        ["@%S+"] = "@parameter",
        ["^%s*(Parameters:)"] = "@text.title",
        ["^%s*(Return:)"] = "@text.title",
        ["^%s*(See also:)"] = "@text.title",
        ["{%S-}"] = "@parameter",
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
      enabled = false,
      view = "notify"
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Popupmenu

    opts.popupmenu = {
      enabled = true,
      backend = "nui",
      scrollbar = false,
      -- kind_icons = {},
    }
    -- --------------------------------------------------------------------- }}}
    -- {{{ Presets

    opts.presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
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
          any = {
            -- { find = "E490: No fold found" },
            { find = "Already at oldest change" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "^%d+ fewer lines;?" },
            { find = "^%d+ more lines;?" },
            { find = "^%d+ line lesses;?" },
            { find = ".*Pattern not found.*$" },
            { find = '^%d+ lines .ed %d+ times?$' },
            { find = '^%d+ lines yanked$' },
            { kind = 'wmsg' },
            { kind = 'emsg', find = 'E486' },
            { kind = 'echo', find = 'E490' },
          }
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
          },
        },
        view = "mini",
      },

    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Smart move

    opts.smart_move = {
      enable = true,
      excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
    }
    -- --------------------------------------------------------------------- }}}
    -- {{{ Views

    opts.views = {
      mini = {
        align = "message-right",
        -- position = { col = 5 },
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
