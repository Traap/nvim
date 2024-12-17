return {
  "Traap/vim-bundle-plantuml",
  event = require("traap.config.events").file,
  enabled = true,

  keys = {
    {"<leader>gu", "<cmd>PlantUmlAssemble<cr>"},
    {"<leader>gv", "<cmd>PlantUmlView<cr>"},
  },

  dependencies = {
    "aklt/plantuml-syntax",
  },
}
