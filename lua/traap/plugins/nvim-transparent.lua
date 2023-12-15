return {
    "xiyaowong/nvim-transparent",
    enabled = true,
    lazy = true,
    event = "VimEnter",

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
