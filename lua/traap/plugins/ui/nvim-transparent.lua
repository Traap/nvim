return {
    "xiyaowong/nvim-transparent",
    enabled = false,
    event = "VeryLazy",

    opts = {
      enable = true,
      "Comment",
      extra_gropus = {
        "CursorLine", "CursorLineNr", "CursorLineSign",
        "Folded", "LineNr", "Normal", "SignColumn",
      },
      exclude = {
        "ColorColumn", "EndOfBuffer", "NonText",
      },
    },

    config = function()
      vim.cmd([[TransparentEnable]])
    end,
  }
