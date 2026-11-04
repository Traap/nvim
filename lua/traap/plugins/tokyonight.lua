local platform = require("traap.core.platform")
return {
  "folke/tokyonight.nvim",
  event = "VeryLazy",
  enabled = true and platform.is_nvim(),
  -- lazy = false,
  priority = 1000,

  opts = function(_, opts)
    opts.transparent = true
    opts.style = "night"
    -- TokyoNight 4 removed hide_inactive_statusline. Lualine uses one global
    -- statusline, and lualine_bold is now a top-level option.
    opts.lualine_bold = true
    opts.styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
    }

    opts.on_colors = function(colors)
      -- colors.border = "#3b4261"
      colors.border = "#bb9af7"
    end
  end,

  config = function(_, opts)
    require("tokyonight").setup(opts)
  end,
}
