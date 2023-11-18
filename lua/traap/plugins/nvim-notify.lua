return {
  "rcarriga/nvim-notify",
  enabled = true,

  opts = function(_, opts)
    opts.background_colour = "#1a1b26"
    opts.timeout = 1000
    opts.top_down = false
  end,
}
