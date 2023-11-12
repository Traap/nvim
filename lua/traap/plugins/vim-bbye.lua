require("traap.core.globals")

local plugin = "vim-bbye"

if Is_Enabled(plugin) then
  Keymap("n", "Q", "<cmd>Bdelete!<cr>")
end

return {
  "moll/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
