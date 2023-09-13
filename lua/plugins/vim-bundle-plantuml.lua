require("config.traap.globals")

local plugin = "vim-bundle-plantuml"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram()<cr>")
end

return {
  "Traap/" .. plugin,
  event = "VeryLazy",
  enabled = Is_Enabled(plugin),
}
