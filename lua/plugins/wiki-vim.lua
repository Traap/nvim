Is_Enabled = require("config.functions").is_enabled

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
}
