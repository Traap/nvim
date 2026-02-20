return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  enable = false,

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
