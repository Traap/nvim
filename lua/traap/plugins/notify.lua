return {
  "rcarriga/nvim-notify",
  enabled = true,
  event = "VeryLazy",
  priority = 1000,
  config = function()
    local notify = require("notify")

    -- Defaults + just set the transparency base color
    notify.setup({
      background_colour = "#000000",
    })

    -- Route vim.notify through nvim-notify everywhere
    vim.notify = notify
  end,
}
