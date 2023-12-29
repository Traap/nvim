return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",
  enabled = true,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Define events to load Harpoon.

  keys = function()
    local mark = require("harpoon" .. ".mark")
    local ui = require("harpoon" .. ".ui")
    return {
      -- Harpoon marked files 1 through 4
      {"<a-1>", function() ui.nav_file(1) end, desc ="Harpoon buffer 1"},
      {"<a-2>", function() ui.nav_file(2) end, desc ="Harpoon buffer 2"},
      {"<a-3>", function() ui.nav_file(3) end, desc ="Harpoon buffer 3"},
      {"<a-4>", function() ui.nav_file(4) end, desc ="Harpoon buffer 4"},

      -- Harpoon next and previous.
      {"<a-5>", function() ui.nav_next() end, desc ="Harpoon next buffer"},
      {"<a-6>", function() ui.nav_prev() end, desc ="Harpoon prev buffer"},

      -- Harpoon user interface.
      {"<a-7>", function() ui.toggle_quick_menu() end, desc ="Harpoon Toggle Menu"},
      {"<a-8>", function() mark.add_file() end, desc ="Harpoon add file"},
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = function(_, opts)
    opts.global_settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configure harpoon.

  config = function(_, opts)
    require("harpoon").setup(opts)
  end,

  -- ----------------------------------------------------------------------- }}}
}
