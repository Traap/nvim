local platform = require("traap.core.platform")
return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",
  enabled = true and platform.is_nvim(),

  event = require("traap.config.events").file,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Defin events to load Harpoon.

  keys = function()
    local keys = {
      -- Harpoon marked files 1 through 4
      {"<a-1>",
        function()
          require("harpoon"):list():select(1)
        end, desc ="Harpoon buffer 1"
      },

      {"<a-2>",
        function()
          require("harpoon"):list():select(2)
        end, desc ="Harpoon buffer 2"
      },

      {"<a-3>",
        function()
          require("harpoon"):list():select(3)
        end, desc ="Harpoon buffer 3"
      },

      {"<a-4>",
        function()
          require("harpoon"):list():select(4)
        end, desc ="Harpoon buffer 4"
      },

      -- Harpoon next and previous.
      {"<a-5>",
        function()
          require("harpoon"):list():next()
        end, desc ="Harpoon next buffer"
      },

      {"<a-6>",
        function()
          require("harpoon"):list():next()
        end, desc ="Harpoon prev buffer"
      },

      -- Harpoon user interface.
      {"<a-7>",
        function()
          local harpoon = require("harpoon")
         harpoon.ui:toggle_quick_menu(harpoon:list())
        end, desc ="Harpoon Toggle Menu"
      },

      {"<a-8>",
        function()
          require("harpoon"):list():add()
        end, desc ="Harpoon Tadd file"
      },
    }
    return keys
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = {
    settings = {
      enter_on_sendcmd = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      save_on_change = true,
      save_on_toggle = false,
      sync_on_ui_close = false,
      tmux_autoclose_windows = false,
    },
  },

  -- ----------------------------------------------------------------------- }}}
}
