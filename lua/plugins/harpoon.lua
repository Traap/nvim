Is_Enabled = require("config.functions").is_enabled
In_Tmux = require("config.functions").in_tmux

-- Youtube: load Harpoon when an keybinding is pressed.

return {
  "ThePrimeagen/harpoon",
  keys = {
    "<leader>ha",
    "<leader>hu",
  },
  enabled = Is_Enabled("harpoon"),
  opts = {
    global_settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon" },
      mark_branch = false,
    },
  },
  config = function(_, opts)
    require("harpoon").setup(opts)
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    vim.keymap.set("n", "<leader>ha", mark.add_file)
    vim.keymap.set("n", "<leader>hu", ui.toggle_quick_menu)

    vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
  end,
}
