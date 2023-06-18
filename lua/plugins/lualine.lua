Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "lualine.nvim"

return {
  "nvim-lualine/" .. plugin,
  event = 'VeryLazy' ,
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults("lualine.nvim") then
      opts = opts
    else
      opts.options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          winbar = {},
          statusline = { "alpha", "dashboard" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      }

      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      }

      opts.tabline = {}
      opts.winbar = {}
      opts.inactive_winbar = {}
      opts.extensions = {}
    end
  end,
}
