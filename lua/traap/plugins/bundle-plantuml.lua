return {
  "Traap/vim-bundle-plantuml",
  enabled = true,
  event = 'VeryLazy',
  ft = { "puml" },

  keys = {
    { "<leader>gu", "<cmd>PlantUmlAssemble<cr>" },
    { "<leader>gv", "<cmd>PlantUmlView<cr>" },
  },

  dependencies = {
    "aklt/plantuml-syntax",
  },
}
