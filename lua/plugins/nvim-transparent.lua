require("config.globals")

local plugin = "nvim-transparent"

return {
    "xiyaowong/" .. plugin,
    enabled = Is_Enabled(plugin),
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
