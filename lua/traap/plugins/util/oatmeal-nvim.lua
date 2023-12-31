return {
  "dustinblackman/oatmeal.nvim",
  enabled = false,

  cmd = { "Oatmeal" },

  keys = {
    { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
  },

  opts = function(_, opts)
    opts.backend = "openai"
    opts.model = "gpt-3.5-turbo"
  end,

  config = function(_, opts)
    require("oatmeal").setup(opts)
  end,
}

