local platform = require("traap.core.platform")
return {
  "iamcco/markdown-preview.nvim",
  enabled = false and platform.is_nvim(),
  ft = { "wiki", "markdown", "md", "puml" },
  build = "cd app && yarn install",
}
