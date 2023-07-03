require("config.globals")

local plugin = "virtcolumn.nvim"

return {
    "xiyaowong/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
}
