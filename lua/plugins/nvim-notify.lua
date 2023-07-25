require("config.traap.globals")

return {
  "rcarriga/nvim-notify",
  enabled = Is_Enabled("nvim-notify"),
  opts = function(_, opts)
    if Use_Default_Opts("nvim-notify") then
      opts = opts
    else
      opts.background_colour = "#1a1b26"
      opts.timeout = 1000
      opts.top_down = false
    end
  end,
}
