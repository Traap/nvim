  {
    "rcarriga/nvim-notify",
    event = "BufEnter",
    enabled = Is_Enabled("nvim-notify"),
    opts = function(_, opts)
      if true == true then
        opts.background_colour = "#1a1b26"
        opts.level = 3
        opts.timeout = 1500
        opts.render = "minimal"
        opts.top_down = false
        opts.max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end
        opts.max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end
      else
        opts = {}
      end
    end,
  },

