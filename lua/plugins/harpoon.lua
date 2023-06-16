local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "harpoon"

return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/" .. plugin,
  enabled = Is_Enabled(plugin),

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Define events to load Harpoon.

  keys = {
    "<a-1>",
    "<a-2>",
    "<a-3>",
    "<a-4>",
    "<a-5>",
    "<a-6>",
    "<a-7>",
    "<a-8>",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { plugin, "alpha", "dashboard", "gitcommit" },
        mark_branch = false,
      }
    end
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configure harpoon.

  config = function(_, opts)
    require(plugin).setup(opts)
    local mark = require(plugin .. ".mark")
    local ui = require(plugin .. ".ui")

    -- Harpoon marked files 1 through 4.
    vim.keymap.set("n", "<a-1>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<a-2>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<a-3>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<a-4>", function() ui.nav_file(4) end)

    -- Harpoon next and previous.
    vim.keymap.set("n", "<a-5>", function() ui.nav_next() end)
    vim.keymap.set("n", "<a-6>", function() ui.nav_prev() end)

    -- Harpoon user interface.
    vim.keymap.set("n", "<a-7>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<a-8>", mark.add_file)

  end,

  -- ----------------------------------------------------------------------- }}}
}
