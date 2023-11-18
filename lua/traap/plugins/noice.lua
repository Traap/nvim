require("traap.core.globals")

Keymap("n", "<leader>ne", "<cmd>NoiceErrors<cr>")
Keymap("n", "<leader>nh", "<cmd>NoiceHistory<cr>")

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  keys = false,

  opts = function(_, opts)
    opts.presets = {
      bottom_search = false,
      lsp_doc_border = true,
    }

    opts.cmdline_popup = {
      views = { position = { row = "50%", col = "50%"  } },
    }

    opts.lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    }

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

      {
        filter = {
          event = "msg_show",
          kind = "echo",
          -- any = {
          --   { find = "EasyAlign" },
          -- },
        },
        opts = { skip = true },
      },
    }
  end,
}
