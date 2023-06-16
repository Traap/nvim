Is_Enabled = require("config.functions").is_enabled

local plugin = "fzf.vim"

return {
    "junegunn/" .. plugin,
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled(plugin),
    dependencies = { "Traap/vim-bundle-fzf" },
}
