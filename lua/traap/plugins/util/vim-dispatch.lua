require("traap.core.globals")

local plugin = "vim-dispatch"

return {
  "tpope/vim-dispatch",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
}
