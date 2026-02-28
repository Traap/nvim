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
    opts.styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
      hide_inactive_statusline = true,
      lualine_bold = true,
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
