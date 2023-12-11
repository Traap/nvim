return {
  "lervag/wiki.vim",
  enabled = true,

  cmd = { "WikiIndex", "WikiJournal" },
  ft = { "wiki", "md" },

  dependencies = {
    "lervag/wiki-ft.vim",
    "Traap/vim-bundle-wiki.vim",
  },

  keys = {
    {"<leader>wb", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Backlog.md<cr>", "Wiki Backlog"},
    {"<leader>wa", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Acronyms.md<cr>", "Wiki Acronyms"},
    {"<leader>wk", "<cmd>edit " .. os.getenv("WORKHOME") .. "/wiki/index.md<cr>", "Work Wiki"},
    {"<leader>yt", "<cmd>edit " .. os.getenv("YOUTUBEHOME") .. "/wiki/index.md<cr>", "YouTube Wiki"},
    {"<leader>we", "<cmd>WikiExport<cr>", "Wiki Export"},
    {"<leader>wi", "<cmd>WikiIndex<cr>", "Wiki Index"},
    {"<leader>wj", "<cmd>WikiJournal<cr>", "Wiki Journal"},
    {"<leader>wp", "<cmd>WikiFzfPages<cr>", "Wiki FzF Pages"},
    {"<leader>wv", "<cmd>lua Page_Viewer()<cr>"}
  },
}
