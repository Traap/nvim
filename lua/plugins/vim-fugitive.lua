require("config.traap.globals")

local plugin = "vim-fugitive"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>gP", "<cmd>G pull<cr>")
  Keymap("n", "<leader>gc", "<cmd>G commmit<cr>")
  Keymap("n", "<leader>gd", "<cmd>G diff<cr>")
  Keymap("n", "<leader>gl", "<cmd>G log<cr>")
  Keymap("n", "<leader>gh", "<cmd>vert bo help fugitive<cr>")
  Keymap("n", "<leader>gp", "<cmd>G push<cr>")
  Keymap("n", "<leader>gs", "<cmd>G<cr>")
end

return {
  "tpope/" .. plugin,
  lazy = false,
  enabled = Is_Enabled(plugin),
}
