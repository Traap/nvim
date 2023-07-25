require("config.traap.globals")

local plugin = "wiki.vim"

return {
  "lervag/" .. plugin,
  cmd = { "WikiIndex", "WikiJournal" },
  ft = { "wiki", "md", "puml" },
  enabled = Is_Enabled(plugin),
  dependencies = {
    "lervag/wiki-ft.vim",
    "Traap/vim-bundle-plantuml",
    "Traap/vim-bundle-wiki.vim",
  },
  keys = {
    {"<leader>wb", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Backlog.md<cr>", "Wiki Backlog"},
    {"<leader>wa", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Acronyms.md<cr>", "Wiki Acronyms"},
    {"<leader>we", "<cmd>WikiExport<cr>", "Wiki Export"},
    {"<leader>wi", "<cmd>WikiIndex<cr>", "Wiki Index"},
    {"<leader>wj", "<cmd>WikiJournal<cr>", "Wiki Journal"},
    {"<leader>wp", "<cmd>WikiFzfPages<cr>", "Wiki FzF Pages"},
    {"<leader>wv", "<cmd> lua Page_Viewer()<cr>"}
  }
}
