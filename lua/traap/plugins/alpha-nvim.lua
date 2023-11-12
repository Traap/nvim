require("traap.core.globals")

local plugin = "alpha-nvim"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>aa", "<cmd>Alpha<cr>")
end

return {
  "goolord/" .. plugin,
  key = {"<leader>aa", "<cmd>Alpha<cr>"},
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  config = true,
}
