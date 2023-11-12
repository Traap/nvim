require("traap.core.globals")

local plugin = "zen-mode.nvim"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>oz", [[<cmd>lua require("zen-mode").toggle()<cr>]])
end

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),

  opts = {
    window = {
      width = 0.65,
      height = 0.85,
      options = {
        colorcolumn = "",
        cursorcolumn = false,
        cursorline = false,
        number = true,
        relativenumber = true,
      },
    },
    event = { "BufEnter *.rb" },
    plugins = {
      enabled = true,
      options = {
        ruler = false,
        showmd = true,
      },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      alacritty = {
        enabled = true,
        font = "15",
      },
    },
  },
}
