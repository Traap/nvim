return {
  "lervag/wiki.vim",
  enabled = true,

  cmd = { "WikiIndex", "WikiJournal" },
  ft = { "wiki", "md" },

  keys = {
    {"<leader>pw", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/index.md<cr>", desc = "Personal Wiki"},
    {"<leader>wb", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Backlog.md<cr>", desc = "Wiki Backlog"},
    {"<leader>wa", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Acronyms.md<cr>", desc = "Wiki Acronyms"},
    {"<leader>wk", "<cmd>edit " .. os.getenv("WORKHOME") .. "/Wiki/index.md<cr>", desc = "Work Wiki"},
    {"<leader>yt", "<cmd>edit " .. os.getenv("YOUTUBEHOME") .. "/wiki/index.md<cr>", desc = "YouTube Wiki"},
    {"<leader>we", "<cmd>WikiExport<cr>", desc = "Wiki Export"},
    {"<leader>wi", "<cmd>WikiIndex<cr>", desc = "Wiki Index"},
    {"<leader>wj", "<cmd>WikiJournal<cr>", desc = "Wiki Journal"},
    {"<leader>wp", "<cmd>WikiFzfPages<cr>", desc = "Wiki FzF Pages"},
    {"<leader>wv", "<cmd>lua Page_Viewer()<cr>", desc = "Wiki View Exported Page" }
  },
}
