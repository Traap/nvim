return {
  "rcarriga/nvim-notify",
  enabled = false,

  opts = function(_, opts)
    opts.background_colour = "NotifyBackground"
    opts.timeout = 1000
    opts.top_down = true
  end,
}
