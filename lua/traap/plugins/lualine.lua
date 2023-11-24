return {
  "nvim-lualine/lualine.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = function(_, opts)
    opts.options = {
      icons_enabled = true,
      theme = "tokyonight",
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


      lualine_x = {
        { -- Recording macro
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },

        {
          "progress"
        },
      },
      lualine_y = { "fileformat", "filetype" },
      lualine_z = { "encoding" },
    }

    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },

      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    opts.tabline = {}
    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = {}
  end,
}
