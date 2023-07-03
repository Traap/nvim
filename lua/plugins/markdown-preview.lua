require("config.globals")

local plugin = "markdown-preview.nvim"

return {
  "iamcco/" .. plugin ,
  ft = "md",
  enabled = Is_Enabled(plugin),
}
