require("config.globals")

local plugin = "nvim-dap"

return {
  "mfussenegger/" .. plugin,
  enabled = Is_Enabled(plugin),
}
