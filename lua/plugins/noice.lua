Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = Is_Enabled("noice.nvim"),
  keys = false,
  opts = function(_, opts)
    if Use_Defaults("noice.nvim") then
      -- Use LazyVim default setup.
      opts = opts
    else
      -- Use my customizations.
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
            kind = "wmsg",
          },
          opts = { skip = true },
        },
      }
    end
  end,
}
