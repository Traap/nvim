local platform = require("traap.core.platform")
return {
  "jackMort/ChatGPT.nvim",
  enabled = true and platform.is_nvim(),
  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTEditWithInstructions",
    "ChatGPTRun",
    "ChatGPTCompleteCode",
  },

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
