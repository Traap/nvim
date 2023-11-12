require("traap.core.globals")

return {
  "rcarriga/nvim-notify",
  enabled = Is_Enabled("nvim-notify"),

  opts = function(_, opts)
    opts.background_colour = "#1a1b26"
    opts.timeout = 1000
    opts.top_down = false
  end,
}
