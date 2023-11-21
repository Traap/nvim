return {
  "Traap/vim-bundle-plantuml",
  event = {"BufReadPost", "BufNewFile"},
  enabled = true,

  keys = {
    {"<leader>gu", "<cmd>PlantUmlAssemble<cr>"},
    {"<leader>gv", "<cmd>PlantUmlView<cr>"},
  },

  dependencies = {
    "aklt/plantuml-syntax",
  },
}
