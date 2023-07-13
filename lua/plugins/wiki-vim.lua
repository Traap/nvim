require("config.globals")

local plugin = "wiki.vim"

if Is_Enabled(plugin) then
  if vim.fn.empty(os.getenv("WSL_DISTRO_NAME")) ~= 0 then
    PDF_VIEWER = "okular"
  else
    PDF_VIEWER = "SumatraPDF.exe"
  end

  Keymap("n", "<leader>wv", '<cmd>lua Page_Viewer()<cr>')

end

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
    {"<leader>wa", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Acronyms.md<cr>", "Wiki Acronyms"},
    {"<leader>wb", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/journal/Backlog.md<cr>", "Wiki Backlog"},
    {"<leader>we", "<cmd>WikiExport<cr>", "Wiki Export"},
    {"<leader>wi", "<cmd>WikiIndex<cr>", "Wiki Index"},
    {"<leader>wj", "<cmd>WikiJournal<cr>", "Wiki Journal"},
    {"<leader>wp", "<cmd>WikiFzfPages<cr>", "Wiki FzF Pages"},
  }
}
