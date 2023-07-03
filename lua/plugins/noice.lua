Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled
Use_Defaults = require("config.functions").use_plugin_defaults

local plugin = "noice.nvim"

return {
  "folke/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
  keys = false,
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
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
