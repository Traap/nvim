return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,

  opts = function(_, opts)
    opts.transparent = false
    opts.style = "night"
    opts.styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
      hide_inactive_statusline = true,
      lualine_bold = true,
    }
  end,

  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
