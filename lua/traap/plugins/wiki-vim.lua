local platform = require("traap.core.platform")
return {
  "lervag/wiki.vim",
  enabled = true and platform.is_nvim(),

  cmd = { "WikiIndex", "WikiJournal" },
  ft = { "wiki", "md" },
}
