return {
  "jackMort/ChatGPT.nvim",
  event = require("traap.config.events").file,
  enabled = true,

  config = function()
    require("chatgpt").setup()
  end,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
