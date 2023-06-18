Customize = require("config.customize")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "virtcolumn.nvim"

return {
    "xiyaowong/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
}
