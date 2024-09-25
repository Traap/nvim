return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
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
      colors.border = "#3b4261"
    end
  end,

  config = function(_, opts)
    require("tokyonight").setup(opts)
  end,
}
