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

  config  = function()
    -- TODO: Your choices are: small, medium, large
    local implementation = "medium"
    if implementation == "small" then
      -- {{{ Small implementation.

      require("noice").setup({})

      -- ------------------------------------------------------------------------}}}
    elseif implementation == "medium" then
      -- {{{ Medium implementation.

      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = { pattern = "^:", icon = "󰳟", lang = "vim" },
          },
        },
        presets = {
          bottom_search = false,
        },

        views = {
          mini = {
            win_options = {
              winblend = 0,
            },
          },
        },

        routes = {
          { filter = {
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

        { filter = {
          event = "msg_show",
          kind = "emsg",
          any = {
            -- E490
            { find = "No fold found" },
            -- E486
            { find = "Pattern not found" },
          },
        },
        opts = { skip = true },
      },

      { filter = {
        event = "msg_show",
        kind = "wmsg",
      },
      opts = { skip = true },
    },
  },

})

-- ------------------------------------------------------------------------}}}
    elseif implementation == "large" then
      -- {{{ Huge implementation.

      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {},
          format = {
            cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex", title = "" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" , title = "" },
            filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
            input = {},
          },
        },

        messages = {
          enabled = true,
          view = "mini",
          view_error = "notify",
          view_warn = "mini",
          view_history = "messages",
          view_search = false,
        },

        popupmenu = {
          enabled = true,
          backend = "cmp",
          kind_icons = {},
        },


        redirect = {
          view = "popup",
          filter = { event = "msg_show" },
        },

        commands = {

          -- : Noice or Noice history
          history = {
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp", kind = "message" },
              },
            },
          },

          -- :Noice last
          last = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp", kind = "message" },
              },
            },
            filter_opts = { count = 1 },
          },

          -- :Noice errors
          errors = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = { error = true },
            filter_opts = { reverse = true },
          },
        },

        notify = {
          enabled = true,
          view = "notify",
        },

        lsp = {
          progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30,
            view = "mini",
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
          },

          hover = {
            enabled = true,
            view = nil,
            opts = {},
          },

          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true,
              luasnip = true,
              throttle = 50,
            },
            view = nil,
            opts = {},
          },

          message = {
            enabled = true,
            view = "notify",
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
        },

        markdown = {
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
        },

        health = {
          checker = true,
        },

        smart_move = {
          enabled = true,
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },

        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true , -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },

        throttle = 1000 / 30,

        views = {
          mini = {
            win_options = {
              winblend = 0,
            },
          },

          notify = {
            size = {
              width = 30
            }
          },
          cmdline_popup = {
            position = {
              row = "40%",
              col = "50%",
            },
            size = {
              width = "50%",
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            scrollbar = false,
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "TelescopeBorder"
              },
            },
          },

          popupmenu = {
            relative = "editor",
            position = {
              row = "40%",
              col = "50%",
            },
            size = {
              width = "100%",
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "TelescopeBorder"
              },
            },
          },
        },

        routes = {

          { filter = {
            event = "msg_show",
            kind = "",
            any = {
              { find = "Prompt" },
              { find = "No lines in buffer" },
              { find = "line" },
              { find = "lines" },
            },
          },
          opts = { skip = true },
        },

        { filter = {
          event = "msg_show",
          kind = "emsg",
          any = {
            -- E490
            { find = "No fold found" },
            -- E486
            { find = "Pattern not found" },
          },
        },
        opts = { skip = true },
      },

      { filter = {
        event = "msg_show",
        kind = "wmsg",
      },
      opts = { skip = true },
    },
  },
})

-- ------------------------------------------------------------------------}}}
    else
      -- {{{ Default is the catch all

      require("noice").setup({})

      -- ------------------------------------------------------------------------}}}
    end
  end,
}
