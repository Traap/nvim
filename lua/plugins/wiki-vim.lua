require("config.globals")

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
   {"<leader>wa", "<cmd>edit /home/traap/git/wiki/journal/Acronyms.md<cr>", "Wiki Acronyms"},
   {"<leader>wb", "<cmd>edit /home/traap/git/wiki/journal/Backlog.md<cr>", "Wiki Backlog"},
   {"<leader>we", "<cmd>WikiExport<cr>", "Wiki Export"},
   {"<leader>wi", "<cmd>WikiIndex<cr>", "Wiki Index"},
   {"<leader>wj", "<cmd>WikiJournal<cr>", "Wiki Journal"},
   {"<leader>wp", "<cmd>WikiFzfPages<cr>", "Wiki FzF Pages"},
   {"<leader>wv", "<cmd><execute !g.traap_pdf_viewer g.wiki_root/printed/api.expand('%:p:t:r').pdf &cr>", "Wiki View PDF"},
  }
}
