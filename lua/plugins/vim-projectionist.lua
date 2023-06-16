Is_Enabled = require("config.functions").is_enabled

local plugin = "vim-projectionist"

return {
  "tpope/" .. plugin,
  ft = { "c", "cpp", "rb" },
  enabled = Is_Enabled(plugin),
}
