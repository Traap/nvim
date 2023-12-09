require("config.traap.globals")

local plugin = "vim-bundle-plantuml"

return {
  "Traap/" .. plugin,
  event = {"BufReadPost", "BufNewFile"},
  enabled = Is_Enabled(plugin),

  keys = {
    {"<leader>gu", "<cmd>PlantUmlAssemble<cr>"},
    {"<leader>gv", "<cmd>PlantUmlView<cr>"},
  },

  dependencies = {
    "aklt/plantuml-syntax",
  },
}
