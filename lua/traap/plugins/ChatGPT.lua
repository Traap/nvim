return {
  "jackMort/ChatGPT.nvim",
  enabled = true and (not vim.g.vscode),

  event = require("traap.config.events").file,

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
