require("config.traap.globals")

local plugin = "vim-most-minimal-folds"

return {
  "vim-utils/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
