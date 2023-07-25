require("config.traap.globals")

local plugin = "vim-bundle-plantuml"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>gu", "<cmd>call GenerateUmlDiagram<cr>")
end

return {
  "Traap/" .. plugin,
  ft = "puml",
  enabled = Is_Enabled(plugin),
  dependencies = { "aklt/plantuml-syntax" },
}
