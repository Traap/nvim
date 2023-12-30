return  {
  "rcarriga/vim-ultest",
  requires = { "vim-test/vim-test" },

  enable = false,

  keys = { "<leader>ut" },

  cmd = {
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestLast",
    "TestVisit",
    "Ultest",
    "UltestNearest",
    "UltestDebug",
    "UltestLast",
    "UltestSummary",
  },

  module = "ultest",

  build = ":UpdateRemotePlugins",

  config = function()
    require("config.test").setup()
  end,
}
