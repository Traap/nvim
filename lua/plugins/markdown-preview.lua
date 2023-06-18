Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled

local plugin = "markdown-preview.nvim"

return {
  "iamcco/" .. plugin ,
  ft = "md",
  enabled = Is_Enabled(plugin),
}
